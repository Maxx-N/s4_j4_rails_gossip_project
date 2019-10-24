# On appelle la gem "Faker" que l'on va utiliser :
  require 'faker'

# On supprime les données précédentes :
  User.destroy_all
  City.destroy_all

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
  puts "10 utilisateurs ont été ajoutés :"
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

# On affiche la liste des villes (en limitant le nombre de colonnes)
  puts "\n"
  puts "10 villes ont été ajoutées :"
  puts "\n"
  tp City.all, :id, :name, :zip_code


=begin
  i = 0
  while i<10
    User.all[i].city = City.find(i+1) 
    User.all[i].save
    i += 1
  end
=end