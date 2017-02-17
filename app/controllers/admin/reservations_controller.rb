class Admin::ReservationsController < Admin::ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    
    @reservation = Reservation.new(reservation_params)
    @reservation.created_by = "Admin"
    @reservation.updated_by = "Admin"
    @reservation.delete_flag = 0
    @reservation.reservation_status_id = 1
    @reservation.reservation_date = Date.strptime(reservation_params["reservation_date"],"%m/%d/%Y")
    
    if @reservation.save
      flash[:success] = 'Tạo mới thành công'
      redirect_to admin_reservations_path
    else
      render 'new'
    end
  end

  def index
    @reservations = Reservation.where(delete_flag: 0)
                    .order(reservation_date: :desc)
                    .all
  end

  def show
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
  def getListCurrentData
#    byebug
     @reservations = Reservation.where(delete_flag: 0).all
     
     @listData = []
     
     @reservations.each do |f|
      @item = {}
      
      @time = (f.hours < 10 ? "0"+f.hours.to_s : f.hours.to_s) + ":" + (f.minutes < 10 ? "0"+f.minutes.to_s : f.minutes.to_s)
      
      @item["title"] = f.name
      @item["start"] = f.reservation_date.strftime("%Y-%m-%d") + " " + @time + ":00"
      @item["hours"] = f.hours < 10 ? "0"+f.hours.to_s : f.hours.to_s
      @item["minutes"] = f.minutes < 10 ? "0"+f.minutes.to_s : f.minutes.to_s
      @item["resDate"] = f.reservation_date.strftime("%d-%m-%Y")
      @item["adult"] = f.adult.to_s
      @item["child"] = f.child.to_s
      
      @listData.push(@item)
      
     end
     
     send_data @listData.to_json
     #send_data [{"title":"demo", "start":"2017-02-15"}]
  end
  
  private
    def reservation_params
      params.require(:reservation).permit(:name, :description, :reservation_date, :hours, :minutes, :adult, :child, :created_by, :updated_by, :delete_flag)
    end
end
