class SystemController < ApplicationController
  before_action :logged_in ,only:%i[ movieindex]
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
