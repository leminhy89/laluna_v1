class Admin::CategoriesController < Admin::ApplicationController
  def new
    @category = Category.new
    if params[:categoryId].present?
      @categoryId = params[:categoryId]
    end
  end

  def create
    @category = Category.new(category_params)
    @category.created_by = "Admin"
    @category.updated_by = "Admin"
    @category.delete_flag = 0
    
    if params["category"]["cateId"].present?
      @category.parentCate = params["category"]["cateId"]
    end
    
    if @category.save
      flash[:success] = 'Tạo mới thành công'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def index
    @categories = Category.where(delete_flag: 0).all
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
    def category_params
      params.require(:category).permit(:name, :description, :created_by, :updated_by, :delete_flag)
    end
end
