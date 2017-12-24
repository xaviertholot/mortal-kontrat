class Weapon < ApplicationRecord
    validates :name, :picture, :force, presence: true
    validates_inclusion_of :force, :in => 1..10
end
