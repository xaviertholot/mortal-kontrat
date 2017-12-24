class Fight < ApplicationRecord
    has_many :character_fights
    has_many :characters, through: :character_fights

    def self.battle(fight_params)
        character_fight_fighter = fight_params[:character_fights][0]
        character_fight_opponent = fight_params[:character_fights][1]
        fighter = Character.find(character_fight_fighter[:character][:id])
        opponent = Character.find(character_fight_opponent[:character][:id])
        fighterWeapon = Weapon.find(character_fight_fighter[:weapon][:id])
        opponentWeapon = Weapon.find(character_fight_opponent[:weapon][:id])

        fight_reports = simulate_fight(fighter, opponent, fighterWeapon, opponentWeapon)

        Fight.new(character_fights: fight_reports)
    end

    def self.calculate_delta_experience_winner(winner, looser)
        if winner.experience > 0
            looser.experience * 10 / winner.experience
        elsif looser.experience > 0
            looser.experience / 20
        else
            10
        end
    end

    def self.calculate_delta_experience_looser(winner, looser)
        if winner.experience > 0
            - looser.experience / winner.experience
        elsif looser.experience > 0
            -looser.experience / 10
        else
            -1
        end
    end

    def self.simulate_fight(fighter, opponent, fighterWeapon, opponentWeapon)
        fighterLifepoints = fighter.get_lifepoints
        opponentLifepoints = opponent.get_lifepoints
        while (opponentLifepoints > 0 and fighterLifepoints > 0)
            # Fight N rounds until someone die !
            fighterLifepoints -= (opponent.attack + opponentWeapon.force)
            opponentLifepoints -= (fighter.attack + fighterWeapon.force)
        end
        fighterDead = fighterLifepoints <= 0
        opponentDead = opponentLifepoints <= 0
        if (fighterDead and opponentDead)
            # draw
            fighterResult = 'draw'
            opponentResult = 'draw'
        elsif (fighterDead)
            # fighter win
            fighterResult = 'win'
            opponentResult = 'loose'
            deltaExperienceFighter = calculate_delta_experience_winner(fighter, opponent)
            deltaExperienceOpponent = calculate_delta_experience_looser(fighter, opponent)
        elsif (opponentDead)
            # opponent win
            fighterResult = 'loose'
            opponentResult = 'win'
            deltaExperienceFighter = calculate_delta_experience_looser(opponent, fighter)
            deltaExperienceOpponent = calculate_delta_experience_winner(opponent, fighter)
        end
        fighterReport = get_fight_report(fighter, fighterWeapon, deltaExperienceFighter, fighterResult)
        opponentReport = get_fight_report(opponent, opponentWeapon, deltaExperienceOpponent, opponentResult)
        return [fighterReport, opponentReport]
    end

    def self.get_fight_report(fighter, fighterWeapon, delta_experience, result)
        CharacterFight.new(
            result: result,
            character: fighter,
            delta_experience: delta_experience,
            weapon: fighterWeapon
        )
    end
end
