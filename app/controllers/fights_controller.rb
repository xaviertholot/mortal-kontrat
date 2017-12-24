class FightsController < ApplicationController
  before_action :set_fight, only: [:show, :update, :destroy]

  # GET /fights
  def index
    @fights = Fight.all

    render json: @fights
  end

  # GET /fights/1
  def show
  end

  # POST /fights
  def create
    @fight = Fight.battle(fight_params)

    if @fight.save
      @fight.character_fights.each do |character_fight|
        character_fight.change_exp
      end
      render template: 'fights/show', status: :created, location: @fight
    else
      render json: @fight.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @fight = Fight.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fight_params
      params.require(:fight).permit(character_fights: [character: [:id], weapon: [:id]])
    end
end
