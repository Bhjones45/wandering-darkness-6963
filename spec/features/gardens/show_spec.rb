require 'rails_helper'
RSpec.describe 'garden show spec' do
  it 'can show list of plants that are included in garden plots' do
    garden = Garden.create!(name: "Turing Community Garden", organic: true)

    plot1 = Plot.create!(number: 25, size: "Large", direction: "East", garden_id: garden.id)
    plot2 = Plot.create!(number: 10, size: "Small", direction: "North", garden_id: garden.id)

    plant1 = Plant.create!(name: 'Apple', description: "Green and sour", days_to_harvest: 30)
    plant2 = Plant.create!(name: 'Orange', description: "Orange and huge", days_to_harvest: 45)
    plant3 = Plant.create!(name: 'Orange', description: "Orange and huge", days_to_harvest: 45)
    plant4 = Plant.create!(name: 'blackberries', description: "There is so many", days_to_harvest: 110)

    plot_plants1 = PlotPlant.create!(plant: plant1, plot: plot1)
    plot_plants1 = PlotPlant.create!(plant: plant2, plot: plot2)
    plot_plants1 = PlotPlant.create!(plant: plant3, plot: plot2)
    plot_plants1 = PlotPlant.create!(plant: plant4, plot: plot1)

    visit "/gardens/#{garden.id}"

    expect(page).to have_content(plot1.number)
    expect(page).to have_content(plant1.name)
    expect(page).to have_content(plot2.number)
    expect(page).to have_content(plant2.name)
  end
end
