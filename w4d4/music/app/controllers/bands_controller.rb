class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def create
    @band = Band.create(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    @band = Band.new
  end

  def show
    @band = Band.find(params[:id])
  end

  def destroy
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end