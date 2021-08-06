class Garden < ApplicationRecord
  has_many :plots

  def list_plants
    plots.joins(:plants)
    .select('DISTINCT plants.*')
    .where('days_to_harvest < 100')
    .order('plants.id')
  end
end
