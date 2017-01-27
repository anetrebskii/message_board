class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def new
    @advertisement = Advertisement.new(address: Address.new)
  end

  def create
    verified_params = params[:advertisement].permit(:title, :description, :price, address_attributes: [ :formatted_address ])
    verified_params['address'] = verified_params['address_attributes']
    result = Advertisement::Create.(verified_params)
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
