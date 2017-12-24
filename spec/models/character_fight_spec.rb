require 'rails_helper'

RSpec.describe CharacterFight, type: :model do
    describe "Test experience calculation feature" do
      fighterId = 1
      context "Positive calculation" do
        let(:character_fight) {
            fighter = Character.create(id: fighterId, name: 'fighter', picture: 'picture.jpg', attack: 2, lifepoints: 2, experience: 0)
            weapon = Weapon.create(name: 'weapon', picture: 'picture.jpg', force: 1)
            CharacterFight.create(character: fighter, weapon: weapon, delta_experience: 10, result: 'win')
        }

        it "Makes the character gain +10 experience" do
          character_fight.change_exp
          expect(character_fight.character.experience).to eq(10)
        end
      end
      context "Negative calculation" do
        let(:character_fight) {
            fighter = Character.create(id: fighterId, name: 'fighter', picture: 'picture.jpg', attack: 2, lifepoints: 2, experience: 20)
            weapon = Weapon.create(name: 'weapon', picture: 'picture.jpg', force: 1)
            CharacterFight.create(character: fighter, weapon: weapon, delta_experience: -10, result: 'loose')
        }

        it "Makes the character loose -10 experience" do
          character_fight.change_exp
          expect(character_fight.character.experience).to eq(10)
        end
      end
      context "Negative calculation that results below zero" do
        let(:character_fight) {
            fighter = Character.create(id: fighterId, name: 'fighter', picture: 'picture.jpg', attack: 2, lifepoints: 2, experience: 20)
            weapon = Weapon.create(name: 'weapon', picture: 'picture.jpg', force: 1)
            CharacterFight.create(character: fighter, weapon: weapon, delta_experience: -30, result: 'loose')
        }

        it "Makes the character loose -30 experience but stops to zero" do
          character_fight.change_exp
          expect(character_fight.character.experience).to eq(0)
        end
      end
    end
end
