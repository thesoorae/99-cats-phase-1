class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    @request = CatRentalRequest.new
    render :new
  end

  def index
  end

  def create
    @request = CatRentalRequest.new(rental_params)
    if @request.save
      redirect_to cat_rental_request_url(@request)
    else
      @cats = Cat.all
      render :new
    end
  end

  def show
    @request = CatRentalRequest.find_by(id: params[:id])
    if @request
      render :show
    else
      redirect_to cat_rental_requests_url
    end
  end
  def approve
    @request = CatRentalRequest.find_by(id: params[:id])
    if @request
      @request.approve!
      render :show
    else
      redirect_to cat_rental_requests_url
    end
  end
  private

  def rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
