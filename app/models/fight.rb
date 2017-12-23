class Fight < ApplicationRecord
    has_many :character_fights
    has_many :characters, through: :character_fights

    def self.battle(fight_params)
        fighter = Character.find(fight_params[:fighter_id])
        opponent = Character.find(fight_params[:opponent_id])
        # multiply life per 100 to have longer fights
        fighterLifepoints = fighter.lifepoints * 100
        opponentLifepoints = opponent.lifepoints * 100
        while (opponentLifepoints > 0 and fighterLifepoints > 0)
            # Fight N rounds until someone die !
            fighterLifepoints -= opponent.attack
            opponentLifepoints -= fighter.attack
        end
        if (fighterLifepoints <= 0 and opponentLifepoints <= 0)
            # draw
            fighterResult = 'draw'
            opponentResult = 'draw'
        elsif (fighterLifepoints <= 0)
            # fighter win
            fighterResult = 'win'
            opponentResult = 'loose'
            deltaExperienceFighter = calculate_delta_experience_winner(fighter, opponent)
            deltaExperienceOpponent = calculate_delta_experience_looser(fighter, opponent)
        elsif (opponentLifepoints <= 0)
            # opponent win
            fighterResult = 'loose'
            opponentResult = 'win'
            deltaExperienceFighter = calculate_delta_experience_looser(opponent, fighter)
            deltaExperienceOpponent = calculate_delta_experience_winner(opponent, fighter)
        end
        fighterReport = CharacterFight.new(result: fighterResult, character: fighter, delta_experience: deltaExperienceFighter)
        opponentReport = CharacterFight.new(result: opponentResult, character: opponent, delta_experience: deltaExperienceOpponent)
        Fight.new(character_fights: [fighterReport, opponentReport])
    end

    def self.calculate_delta_experience_winner(winner, looser)
        if winner.experience > 0
            looser.experience / winner.experience
        elsif looser.experience > 0
            looser.experience / 20
        end
        10
    end

    def self.calculate_delta_experience_looser(winner, looser)
        if winner.experience > 0
            - looser.experience / (10 * winner.experience)
        elsif looser.experience > 0
            -looser.experience / 10
        end
    end
end
