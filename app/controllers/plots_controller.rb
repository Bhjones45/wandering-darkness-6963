class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def update
    plot = Plot.find(params[:id])
    plant = Plant.find_by_name(params[:name])
    plant.delete(params[:plot_id])
    redirect_to "/plots"
  end
end
