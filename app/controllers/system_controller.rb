class SystemController < ApplicationController
  def main
    session[:user_id] = nil
  end

  def register
    @user = User.new
  end

  def createuser
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        Inventory.create(user_id:@user.id)
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :register, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def checklogin
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
      params.require(:user).permit(:username, :password, :firstname, :lastname)
    end

end
