class LoginsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: login_params[:email]).try(:authenticate, login_params[:password])
    if @user
      session[:current_user_id] = @user.id
      #debugger

      #cookies.permanent[:auth_token] = @user.auth_token if login_params[:remember_me] == '1'
      redirect_to @user
    else
      render :login
    end
  end

  def destroy
    reset_session
    #cookies.delete(:auth_token)
    redirect_to root_url
  end



  private

  def login_params
    params.require(:user).permit(:email, :password, :remember_me)
  end
end
