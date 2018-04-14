namespace :dev do

  desc "Setup Development"
  task setup: :environment do
    images_path = Rails.root.join('public','system')

    puts "Executando o setup para desenvolvimento"

    puts "APAGANDO BD... #{%x(rake db:drop)}"
    puts "APAGANDO IMAGENS de public/system... #{%x(rm -rf #{images_path})}"
    puts "CRIANDO BD... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_ads)

    puts "Setup completado com sucesso!"
  end

###############################################################

  desc "Cria Administradores Fake"
  task generate_admins: :environment do

    puts "Cadastrando ADMINISTRADORES FAKE"

    10.times do

    Admin.create!(name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456",
    password_confirmation: "123456",
    role: [0,1,1].sample # O sample é usado para sortear o número 0 e 1
    )

  end

    puts "Administrador FAKE CADASTRADO com sucesso!"
  end

###############################################################

  desc "Cria Membros Fake"
  task generate_members: :environment do

    puts "Cadastrando MEMBROS FAKE"

    100.times do
      Member.create!(
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
    )

  end

    puts "membros FAKE CADASTRADO com sucesso!"
  end

###############################################################

  desc "Cria Anúncios Fake"
  task generate_ads: :environment do

    puts "Cadastrando ANUNCIOS"

    5.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.first,
        category: Category.all.sample, # O sample é usado para sortear o número 0 e 1
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public','templates','images-for-ads',"#{Random.rand(9)}.jpg"), 'r')
      )
  end

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.all.sample,
        category: Category.all.sample, # O sample é usado para sortear o número 0 e 1
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public','templates','images-for-ads',"#{Random.rand(9)}.jpg"), 'r')
      )
  end

  puts "anuncio FAKE CADASTRADO com sucesso!"
end
end
