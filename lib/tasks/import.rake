require 'csv'

namespace :import do
  task items: :environment do
    CSV.foreach() do |row|
      row['unit_price'] = row['unit_price'].to_f / 100
      Item.create!(row.to_h)
    end
  end
end
