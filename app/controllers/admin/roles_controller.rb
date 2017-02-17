class Admin::RolesController < Admin::ApplicationController
  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    @role.created_by = "Admin"
    @role.updated_by = "Admin"
    @role.delete_flag = 0
    
    if @role.save
      flash[:success] = 'Tạo mới thành công'
      redirect_to admin_roles_path
    else
      render 'new'
    end
  end

  def index
    @roles = Role.where(delete_flag: 0).all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
    def role_params
      params.require(:role).permit(:name, :description, :created_by, :updated_by, :delete_flag)
    end
end
