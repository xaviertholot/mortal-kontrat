# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

nb_characters = 10
10.times do
    lifepoints = Faker::Number.between(1, 10)
    experience = Faker::Number.between(0, 1000)
    attack = 10 - lifepoints
    Character.create(name: Faker::Name.name, picture: Faker::Avatar.image, lifepoints: lifepoints, attack: attack, experience: experience)
end

Weapon.create(name: 'Judge gavel', picture: 'judge-gavel.jpg', force: 3)
Weapon.create(name: 'Justice', picture: 'justice.jpg', force: 1)
Weapon.create(name: 'Taser', picture: 'taser.png', force: 5)
Weapon.create(name: 'The Law', picture: 'the-law.jpg', force: 2)
Weapon.create(name: 'Bazooka', picture: 'bazooka.png', force: 10)
