class Garden < ApplicationRecord
  has_many :plots

  def list_plants
    plots.joins(:plants)
    .select(:plants)
    .distinct
    .where('days_to_harvest < 100')
    .pluck(:name)
  end
end
