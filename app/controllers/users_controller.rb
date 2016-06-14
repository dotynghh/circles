class UsersController < ApplicationController

  before_filter :auth_user, only: [:index]

  def index
    @users = User.page(params[:page] || 1).per_page(params[:per_page] || 10)
      .order("id desc")
  end
  def blogs
    @blogs = current_user.blogs.page(params[:page] || 1).per_page(params[:per_page] || 8)
      .order("id desc")
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_attrs)
    if @user.save
      flash[:notice] = "注册成功，请登录"
      redirect_to new_session_path
    else
      render action: :new
    end
  end

  def edit
    @user = User.find params[:id]
    render action: :new
  end

  def update
    @user = User.find params[:id]
    if @user.change_password(params[:oldpassword], params[:password], params[:password_confirmation]) and @user.save
      flash[:notice] = "密码修改成功"
      redirect_to users_path
    else
      flash[:notice] = "密码修改失败"
      render action: :new
    end
  end

  private
  def user_attrs
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end