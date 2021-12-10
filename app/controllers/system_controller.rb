class SystemController < ApplicationController
  before_action :logged_in ,only:%i[ movieindex movietimetable selectseat maketicket showticketorder beverage_ticket]
  def main
    session[:user_id] = nil
  end

  def register
    @user = User.new
  end

  def createuser
    u = user_params
    @user = User.new(username:u[:username],firstname:u[:firstname] ,lastname:u[:lastname] ,password:u[:password])

    password = u[:password]
    confirm_password = u[:confirm_password]

    @correctpass = true

    if (!confirm_password.eql?(password))
      @correctpass = false
    end

    respond_to do |format|
      if (@correctpass && @user.save)
        Inventory.create(user_id:@user.id)
        format.html { redirect_to main_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        @alertword = (@correctpass)? "" : "Password and confirm_password are not equal"
        @user.valid?
        if (!@correctpass)
          @user.errors[:base] << "Password and confirm_password are not equal"
        end
        format.html { render "register", status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def checklogin
    # check that username and password are correct
    @loginUsername = params[:username]
    @loginPassword = params[:password]
    @usermatch = false
    @find = User.find_by(username:@loginUsername)

    if (@find && @find.authenticate(@loginPassword))
      redirect_to movieindex_path , notice: "login successfully"
      @usermatch = true
      session[:user_id] = @find.id
    end

    if(@usermatch == false)
      redirect_to main_path , alert: "Wrong username or password"
    end

  end

  def movieindex
    @username = User.find(session[:user_id]).username
    @movie_list = Movie.nowshowingmovies
  end

  def movietimetable
    @movie_id = params[:movie_id]
    @movie = Movie.find(@movie_id)
    @movie_name = @movie.name
    @movie_theater = @movie.theatershow(@movie_id)
  end

  def selectseat
    @timetable_id = params[:timetable_id]
    @timetable = Timetable.find(@timetable_id)
    @movie = Movie.find(@timetable.movie_id)
    @theater = Theater.find(@timetable.theater_id)
  end

  def maketicket
    @chairs_input = params[:seat]
    @timetable_id = params[:timetable_id]
    @chairs_id = @chairs_input.map{ |chair| chair.to_i}

    # create ticket for each chair
    tickets_id = []
    @chairs_id.each do |chair_id|
      t = Ticket.create(chair_id:chair_id ,timetable_id:@timetable_id)
      tickets_id.append(t.id)
    end

    # create product for each ticket
    products_id = []
    tickets_id.each do |ticket_id|
      pr = Product.create(productable_type:"Ticket" , productable_id:ticket_id)
      products_id.append(pr.id)
    end

    #create order for insert orderline
    @order = Order.create(user_id:session[:user_id])

    #create orderline for each product
    products_id.each do |product_id|
      Orderline.create(order_id:@order.id , product_id:product_id ,quantity:1 ,price:Product.find(product_id).productable.chair.price )
    end

    respond_to do |format|
      format.html { redirect_to showticketorder_path(@order.id) }
    end

  end

  def showticketorder
    order_id = params[:order_id]
    @order = Order.find(order_id)
  end

  def beverage_ticket
    @order_id = params[:order_id]
    @all_beverages = Beverage.all
  end

  def sendbeverage_ticket
    @quantity = params[:quantity]
    @beverage_id = params[:beverage_id]
    @order_id = params[:order_id].to_i
    @order = Order.find(@order_id)
    # puts "Popcorn #{@quantity}"
    # puts "#{@beverage_id}"

    for i in 1..@quantity.size do
      quantity = @quantity[i].to_i
      beverage_id = @beverage_id[i].to_i

      if (quantity != 0)
        beverage = Beverage.find(beverage_id)
        product = beverage.product

        Orderline.create(order_id:@order.id , product_id:product.id ,quantity:quantity ,price:beverage.price)
      end
    end

    respond_to do |format|
      format.html { redirect_to summaryorder_ticket_path(@order_id)}
    end
  end

  def summaryorder_ticket
    @order_id = params[:order_id]
    @order = Order.find(@order_id)
  end

  def cancleorderline
    orderline_id = params[:orderline_id]
    orderline = Orderline.find(orderline_id)
    order_id = orderline.order.id
    product = orderline.product
    Orderline.destroy(orderline_id)
    if (product.productable_type.eql?("Ticket"))
      ticket = product.productable
      Product.destroy(product.id)
      Ticket.destroy(ticket.id)
    end
    

    respond_to do |format|
      format.html { redirect_to summaryorder_ticket_path(order_id)}
    end
  end

  def cancleorder
    order_id = params[:order_id]
    order = Order.find(order_id)

    orderlines = order.orderlines
    orderlines.each do |orderline|
      product = orderline.product
      orderline_id = orderline.id
      Orderline.destroy(orderline_id)
      if (product.productable_type.eql?("Ticket"))
        ticket = product.productable
        Product.destroy(product.id)
        Ticket.destroy(ticket.id)
      end
      
    end

    Order.destroy(order_id)
    respond_to do |format|
      format.html { redirect_to movieindex_path ,alert:"Cancle order already"}
    end

  end


  private
    def logged_in
      if (session[:user_id])
        return true
      else
        respond_to do |format|
          format.html { redirect_to main_path, alert: "Please Login " }
          format.json { head :no_content }
        end
      end
    end

    def user_params
      params.require(:user).permit(:username, :password, :firstname, :lastname ,:confirm_password)
    end

end
