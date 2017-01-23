class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def new
    @advertisement = Advertisement.new
  end

  # POST
  def create
    result = Advertisement::Create.(params[:advertisement].permit(:title, :description, :price))
    if result.success?
      flash[:notice] = 'Created successful'
      redirect_to root_path
    else
      @advertisement = result['model']
      @errors = result['result.contract.default'].errors
      respond_to do |format|
        format.html { render :new }
      end
    end
  end
end
