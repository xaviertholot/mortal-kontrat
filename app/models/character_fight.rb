class CharacterFight < ApplicationRecord
  belongs_to :character
  belongs_to :fight
  belongs_to :weapon

  enum result: { draw: 0, win: 1 , loose: 2}

  def change_exp
    character.update(experience: (delta_experience || 0) + (character.experience || 0))
  end
end
