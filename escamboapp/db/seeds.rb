# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Cadastrando as CATEGORIAS"

categories = ["Animais e acessórios" ,
              "Esportes" ,
              "Para sua casa" ,
              "Eletrônicos e celulares" ,
              "Música e hobbies" ,
              "Bebês e crianças" ,
              "Moda e beleza" ,
              "Veículos e barcos" ,
              "Imóveis" ,
              "Empregor e negócios" ]

categories.each do |category|
  Category.find_or_create_by(description: category)
end

puts "CATEGORIAS cadastradas com sucesso!"

##############

puts "Cadastrando ADMINISTRADOR PADRÃO"

Admin.create!(
name: "Administrador Geral",
email: "admin@admin.com",
password: "123456",
password_confirmation: "123456",
role: 0
)

puts "Administrador padrão cadastrado com sucesso!"

##############

puts "Cadastrando MEMBRO PADRÃO"

Member.create!(
email: "membro@membro.com",
password: "123456",
password_confirmation: "123456"
)

puts "Membro padrão cadastrado com sucesso!"
