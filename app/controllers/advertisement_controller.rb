class AdvertisementController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    if @advertisement.update_attributes(params[:advertisement].permit(:title, :description, :price))
      redirect_to root_path
    else
      respond_to do |format|
        format.html { render 'new', @advertisement }
      end
    end
  end
end
