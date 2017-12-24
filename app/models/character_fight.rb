class CharacterFight < ApplicationRecord
  belongs_to :character
  belongs_to :fight
  belongs_to :weapon

  enum result: { draw: 0, win: 1 , loose: 2}

  def change_exp
    newExperience = (delta_experience || 0) + (character.experience || 0)
    if (newExperience < 0)
        newExperience = 0
    end
    character.update(experience: newExperience)
  end
end
