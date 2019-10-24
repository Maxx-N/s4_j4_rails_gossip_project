# On appelle la gem "Faker" que l'on va utiliser :
  require 'faker'

# On supprime les données précédentes :
  User.destroy_all
  City.destroy_all
  Gossip.destroy_all

# On crée 10 utilisateurs aléatoirement, notamment grâce à la gem "Faker", entre 15 et 30 ans :
  10.times do |index|
    u = User.new
    u.id = index + 1
    u.first_name = Faker::Name.first_name
    u.last_name = Faker::Name.last_name 
    u.email = u.first_name.downcase + "." + u.last_name.downcase + "@gmail.com"
    u.age = rand(15..30)
    u.description = Faker::Hacker.say_something_smart
    u.save
  end

# On affiche la liste des utilisateurs (en limitant le nombre de colonnes) :
  puts "\n"
  puts "10 utilisateurs ont été ajouté(e)s :"
  puts "\n"
  tp User.all, :first_name, :last_name, :email, :age

# On crée 10 villes aléatoirement, notamment grâce à la gem "Faker" :
  10.times do |index|
    c = City.new
    c.id = index + 1
    c.name = Faker::Address.city
    c.zip_code = Faker::Address.zip
    c.save
  end

# On affiche la liste des villes (en limitant le nombre de colonnes) :
  puts "\n"
  puts "10 villes ont été ajoutées :"
  puts "\n"
  tp City.all, :id, :name, :zip_code

# On attribue aléatoirement une ville à un  utilisateur (plusieurs utilisateurs peuvent venir de la même ville) :
  User.all.each do |u|
    u.city = City.all[rand(0..9)]
    u.save
  end

# On affiche chaque utilisateur et la ville d'où il vient :
  puts "\n"
  puts "Voici les villes des utilisateurs(trices) :"
  puts "\n"
  User.all.each do |u|
    puts "- #{u.first_name} #{u.last_name.upcase} habite à #{u.city.name}"
  end

# On change aléatoirement la ville de l'utilisateur ayant l'ID n°3 et on l'affiche :
  puts "\n"
  puts "#{User.find(3).first_name} vient de déménager..."
  puts "\n"
  print "Il(elle) n'habite plus à #{User.find(3).city.name}"
  User.find(3).update(city_id: rand(1..10))
  puts " mais à #{User.find(3).city.name} !"

# On créé aléatoirement 20 gossips : 
  20.times do |index|
    Gossip.create(id: index + 1, title: Faker::Game.title, content:Faker::TvShows::RickAndMorty.quote)
  end

# On affiche la liste des villes (en limitant le nombre de colonnes) :
  puts "\n"
  puts "20 gossips ont été ajoutés :"
  puts "\n"
  tp Gossip.all, :title


# On attribue aléatoirement chaque potin à un utilisateur : 
  Gossip.all.each do |g|
    g.user = User.all.find(rand(1..10))
    g.save
  end  

# On cite tous les potins d'un utilisateur pris aléatoirement (si il en a posté) : 
  random_user = User.all.find(rand(1..10))
  puts "\n"
  puts "#{random_user.first_name} a dit :"
  random_user.gossips.each do |g|
    puts "- " + g.content
  end


  
