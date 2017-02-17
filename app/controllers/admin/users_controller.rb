class Admin::UsersController < Admin::ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.created_by = "Admin"
    @user.updated_by = "Admin"
    @user.delete_flag = 0
    
    if @user.save
      flash[:success] = 'Tạo mới thành công'
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def index
    @users = User.where(delete_flag: 0).all
  end

  def show
  end

  def destroy
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :role_id, :description, :email, :password)
    end
end
