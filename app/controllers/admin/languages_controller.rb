class Admin::LanguagesController < Admin::ApplicationController
  def new
    @language = Language.new
  end

  def create
    @language = Language.new(role_params)
    @language.created_by = "Admin"
    @language.updated_by = "Admin"
    @language.delete_flag = 0
    
    if @language.save
      flash[:success] = 'Tạo mới thành công'
      redirect_to admin_languages_path
    else
      render 'new'
    end
  end

  def index
    @languages = Language.where(delete_flag: 0).all
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
      params.require(:language).permit(:name, :description, :created_by, :updated_by, :delete_flag)
    end
end
