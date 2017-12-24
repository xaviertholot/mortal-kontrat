require 'rails_helper'

RSpec.describe Fight, type: :model do

    describe "Test fighting feature" do
      context "with two unExperimented characters" do
        fighterId = 1
        opponentId = 2
        let(:valid_battle_attributes) {
            fighter = Character.create(id: fighterId, name: 'fighter', picture: 'picture.jpg', attack: 2, lifepoints: 2, experience: 0)
            opponent = Character.create(id: opponentId, name: 'opponent', picture: 'picture.jpg', attack: 1, lifepoints: 1, experience: 0)
            weapon = Weapon.create(name: 'weapon', picture: 'picture.jpg', force: 1)
            {
                character_fights: [
                    {
                        character: {id: fighter.id},
                        weapon: {id: weapon.id}
                    },
                    {
                        character: {id: opponent.id},
                        weapon: {id: weapon.id}
                    }
                ]
            }
        }

        it "Makes the fighter win and updates the experience" do
          fight = Fight.battle(valid_battle_attributes)
          fight.save
          fighterReport = fight.character_fights.find {|character_fight| character_fight.character.id == fighterId}
          opponentReport = fight.character_fights.find {|character_fight| character_fight.character.id == opponentId}
          expect(fighterReport.result).to eq('win')
          expect(opponentReport.result).to eq('loose')
          expect(fighterReport.delta_experience).to eq(10)
          expect(opponentReport.delta_experience).to eq(-1)
          fight.character_fights.each do |character_fight|
            character_fight.change_exp
          end
          expect(fighterReport.character.experience).to eq(10)
          expect(opponentReport.character.experience).to eq(-0)
        end
      end
      context "with two experimented characters" do
        fighterId = 1
        opponentId = 2
        let(:valid_battle_attributes) {
            fighter = Character.create(id: fighterId, name: 'fighter', picture: 'picture.jpg', attack: 2, lifepoints: 2, experience: 10)
            opponent = Character.create(id: opponentId, name: 'opponent', picture: 'picture.jpg', attack: 1, lifepoints: 1, experience: 100)
            weapon = Weapon.create(name: 'weapon', picture: 'picture.jpg', force: 1)
            {
                character_fights: [
                    {
                        character: {id: fighter.id},
                        weapon: {id: weapon.id}
                    },
                    {
                        character: {id: opponent.id},
                        weapon: {id: weapon.id}
                    }
                ]
            }
        }

        it "Makes the fighter win and updates the experience" do
          fight = Fight.battle(valid_battle_attributes)
          fight.save
          fighterReport = fight.character_fights.find {|character_fight| character_fight.character.id == fighterId}
          opponentReport = fight.character_fights.find {|character_fight| character_fight.character.id == opponentId}
          expect(fighterReport.result).to eq('win')
          expect(opponentReport.result).to eq('loose')
          expect(fighterReport.delta_experience).to eq(100)
          expect(opponentReport.delta_experience).to eq(-10)
          fight.character_fights.each do |character_fight|
            character_fight.change_exp
          end
          fighterReport.character.experience = 110
          opponentReport.character.experience = 90
        end
      end

      context "with two experimented characters, but the opponent is very experimented" do
        fighterId = 1
        opponentId = 2
        let(:valid_battle_attributes) {
            fighter = Character.create(id: fighterId, name: 'fighter', picture: 'picture.jpg', attack: 2, lifepoints: 2, experience: 10)
            opponent = Character.create(id: opponentId, name: 'opponent', picture: 'picture.jpg', attack: 1, lifepoints: 1, experience: 10000)
            weapon = Weapon.create(name: 'weapon', picture: 'picture.jpg', force: 1)
            {
                character_fights: [
                    {
                        character: {id: fighter.id},
                        weapon: {id: weapon.id}
                    },
                    {
                        character: {id: opponent.id},
                        weapon: {id: weapon.id}
                    }
                ]
            }
        }

        it "Makes the fighter win and updates the experience" do
          fight = Fight.battle(valid_battle_attributes)
          fight.save
          fighterReport = fight.character_fights.find {|character_fight| character_fight.character.id == fighterId}
          opponentReport = fight.character_fights.find {|character_fight| character_fight.character.id == opponentId}
          expect(fighterReport.result).to eq('loose')
          expect(opponentReport.result).to eq('win')
          expect(fighterReport.delta_experience).to eq(-1)
          expect(opponentReport.delta_experience).to eq(0)
          fight.character_fights.each do |character_fight|
            character_fight.change_exp
          end
          fighterReport.character.experience = 9
          opponentReport.character.experience = 10000
        end
      end
    end
end
