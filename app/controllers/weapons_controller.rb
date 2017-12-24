class WeaponsController < ApplicationController
  before_action :set_weapon, only: [:show, :update, :destroy]

  # GET /weapons
  # GET /weapons.json
  def index
    @weapons = Weapon.all
  end

  # GET /weapons/1
  # GET /weapons/1.json
  def show
  end

  # POST /weapons
  # POST /weapons.json
  def create
    @weapon = Weapon.new(weapon_params)

    if @weapon.save
      render :show, status: :created, location: @weapon
    else
      render json: @weapon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weapons/1
  # PATCH/PUT /weapons/1.json
  def update
    if @weapon.update(weapon_params)
      render :show, status: :ok, location: @weapon
    else
      render json: @weapon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weapons/1
  # DELETE /weapons/1.json
  def destroy
    @weapon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weapon
      @weapon = Weapon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weapon_params
      params.require(:weapon).permit(:name, :force, :picture)
    end
end
