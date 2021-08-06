require 'rails_helper'
RSpec.describe 'plot index page' do
  it 'can list all numbers of plots and names below' do
    garden = Garden.create!(name: "Turing Community Garden", organic: true)

    plot1 = Plot.create!(number: 25, size: "Large", direction: "East", garden_id: garden.id)
    plot2 = Plot.create!(number: 10, size: "Small", direction: "North", garden_id: garden.id)

    plant1 = Plant.create!(name: 'Apple', description: "Green and sour", days_to_harvest: 30)
    plant2 = Plant.create!(name: 'Orange', description: "Orange and huge", days_to_harvest: 45)

    plot_plants1 = PlotPlant.create!(plant: plant1, plot: plot1)
    plot_plants1 = PlotPlant.create!(plant: plant2, plot: plot2)

    visit "/plots"

    expect(page).to have_content(plot1.number)
    expect(page).to have_content(plant1.name)
    expect(page).to have_content(plot2.number)
    expect(page).to have_content(plant2.name)
  end

  describe 'remove plant from plot index' do
    it 'can remove a plant from the plot index page' do
      garden = Garden.create!(name: "Turing Community Garden", organic: true)

      plot1 = Plot.create!(number: 25, size: "Large", direction: "East", garden_id: garden.id)
      plot2 = Plot.create!(number: 10, size: "Small", direction: "North", garden_id: garden.id)

      plant1 = Plant.create!(name: 'Apple', description: "Green and sour", days_to_harvest: 30, plot_id: plot1)
      plant2 = Plant.create!(name: 'Orange', description: "Orange and huge", days_to_harvest: 45, plot_id: plot2)

      plot_plants1 = PlotPlant.create!(plant: plant1, plot: plot1)
      plot_plants1 = PlotPlant.create!(plant: plant2, plot: plot2)

      visit "/plots"

      expect(page).to have_content(plant1.name)

      click_link "Remove #{plant1.name} from plot"

      expect(page).to_not have_content(plant1.name)
    end
  end
end
