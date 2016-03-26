class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    if(current_user)
      redirect_to action: "show", id: current_user.id
    else
      redirect_to action: "new"
    end
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :show
    else
      render user_params.inspect
    end
  end



  private



  def user_params
    params.require(:user).permit(:firstname, :lastname, :password, :password_confirmation, :email)
  end
end
