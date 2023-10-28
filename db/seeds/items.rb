require 'csv'

csv_text = File.read(Rails.root.join('db', 'data', 'items.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'utf-8')

csv.each do |row|
  unit_price = row['unit_price'].gsub(/[^\d.]/, '').to_f

  item_attributes = {
    'name' => row['name'],
    'description' => row['description'],
    'unit_price' => unit_price,
  }

  Item.create!(item_attributes)
end
