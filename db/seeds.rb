# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User::create username: 'Administrator',
#             password: '1',
#             password_confirmation: '1',
#             permission: 0

Manufacturer::create label: 'Lenel'
ProductType::create label: 'Access Control'
Product::create label: 'OnGuard',
                product_type: ProductType.first.id,
                manufacturer_id: Manufacturer.first.id

