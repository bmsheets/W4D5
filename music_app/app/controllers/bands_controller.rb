class BandsController < ApplicationController
  def index
  end

  def create
    band = Band.new(band_params)
    if band.save
      #???
    else
      flash.now[:errors] = band.errors.full_messages
    end
  end

  def new
    render :new
  end

  def edit
    render :edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
