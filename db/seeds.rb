# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

nb_characters = 10
10.times do
    lifepoints = Faker::Number.between(1, 10)
    attack = 10 - lifepoints
    Character.create(name: Faker::Name.name, picture: Faker::Avatar.image, lifepoints: lifepoints, attack: attack)
end
