class PlantsController < ApplicationController
  def destroy
    plant = Plant.find(params[:id])
    plot = Plot.find(params[:plot_id])
    plot.plants.delete(plant)
    redirect_to "/plots"
  end
end
