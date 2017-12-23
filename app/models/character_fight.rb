class CharacterFight < ApplicationRecord
  belongs_to :character
  belongs_to :fight

  enum result: { draw: 0, win: 1 , loose: 2}
end
