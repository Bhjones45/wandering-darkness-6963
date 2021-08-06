class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def update
    binding.pry
    plot = Plot.find(params[:plot_id])
    plant = Plant.find(params[:id])
    plant.delete(params[:plot_id])
    redirect_to "/plots"
  end

  private
  def plot_params
    params.permit(:number, :size, :direction, :garden_id)
  end
end
