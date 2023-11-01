require 'csv'

namespace :import do
  task products: :environment do
    CSV.foreach do |row|
      row['unit_price'] = row['unit_price'].to_f / 100
      Product.create!(row.to_h)
    end
  end
end
