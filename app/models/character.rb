class Character < ApplicationRecord
    validates :name, :picture, :attack, :lifepoints, presence: true
    validates_inclusion_of :lifepoints, :attack, :in => 1..10
    validate :validate_points_total

    before_validation :set_default_xp, on: :create

    has_many :character_fights
    has_many :fights, through: :character_fights

    def set_default_xp
      self.experience ||= 0
    end

    MAX_TOTAL_POINTS = 10
    def validate_points_total
        if lifepoints && attack
            unless lifepoints + attack <= MAX_TOTAL_POINTS
                errors.add(:total_points, 'You must have maximum ' + MAX_TOTAL_POINTS.to_s + ' points.')
            end
        end
    end
end
