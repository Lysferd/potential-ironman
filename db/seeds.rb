# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



admin = Role::create label: 'Administrator'
draft = Role::create label: 'Draftsman'
commi = Role::create label: 'Commissioner'

User::create email: 'fabioalmeida@ibtecnologia.com.br',
  password: '1',
  password_confirmation: '1',
  name: "Fábio Moritz de Almeida",
  ctps: "3696451-002/PR",
  ci: "11.099.671-3",
  cpf: "080.708.869-27",
  pis: "131.42996.53.1",
  reg: "423",
  role_id: admin.id

User::create name: "David Rocha Milsted",
  password: '1',
  password_confirmation: '1',
  email: "davidmilsted@ibtecnologia.com.br",
  ctps: "3705156-002/PR",
  ci: "80651872-SESP/PR",
  cpf: "070.538.689-90",
  pis: "200.34971-80.1",
  reg: "609",
  role_id: admin.id

lenel = Manufacturer::create label: 'Lenel'

# -=-=-=-=-
# Generate product types.
[ 'Controle de Acesso', 'CFTV', 'Automação Predial' ].each do |l|
  ProductType::create label: l
end

Product::create label: 'OnGuard',
                manufacturer_id: lenel.id,
                product_type: ProductType::find_by_label( 'Controle de Acesso' ).id

