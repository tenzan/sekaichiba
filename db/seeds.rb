# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless User.exists?(email: 'admin@example.com')
  User.create!(email: 'admin@example.com', password: 'password', admin: true)
end

unless User.exists?(email: 'staff@example.com')
  User.create!(email: 'staff@example.com', password: 'password')
end

['Shampoo', 'Conditioner'].each do |name|
  unless Item.exists?(name: name)
    Item.create!(name: name, quantity: 1)
  end
end