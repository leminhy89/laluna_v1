class Admin::ReservationStatusesController < Admin::ApplicationController
  def new
    @reservationStatus = ReservationStatus.new
  end

  def create
    @reservationStatus = ReservationStatus.new(status_params)
    @reservationStatus.created_by = "Admin"
    @reservationStatus.updated_by = "Admin"
    @reservationStatus.delete_flag = 0
    
    if @reservationStatus.save
      flash[:success] = 'Tạo mới thành công'
      redirect_to admin_reservation_statuses_path
    else
      render 'new'
    end
  end

  def index
    @statuses = ReservationStatus.where(delete_flag: 0).all
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
    def status_params
      params.require(:reservation_status).permit(:name, :description, :created_by, :updated_by, :delete_flag)
    end
end
