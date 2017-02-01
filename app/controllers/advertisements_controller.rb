class AdvertisementsController < ApplicationController
  include Trailblazer::Endpoint::Controller

  def index
    @advertisements = Advertisement.all
  end

  def new
    @advertisement ||= Advertisement.new(address: Address.new)
  end

  def create
    verified_params = params[:advertisement].permit(:title, :description, :price, address: [:formatted_address, :lat, :lon])
    endpoint_app ::Advertisement::Create, args: [verified_params] do |m|
      m.success do
        flash[:notice] = 'Created successful'
        redirect_to root_path
      end
      m.invalid do |result|
        @advertisement = result['model']
        @errors = result['result.contract.default'].errors
        respond_to do |format|
          format.html { render :new }
        end
      end
    end
  end
end
