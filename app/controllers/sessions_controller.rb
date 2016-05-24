class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Success Login!"
      redirect_to root_path
    else
      flash[:notice] = "The user name or password is not correct."
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Exit the success."
    redirect_to root_path
  end
end
