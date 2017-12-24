require 'rails_helper'

RSpec.describe FightsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Fight. As you add validations to Fight, be sure to
  # adjust the attributes here as well.

  let(:valid_battle_attributes) {
    fighter = Character.create(name: 'fighter', picture: 'picture.jpg', attack: 2, lifepoints: 2)
    opponent = Character.create(name: 'opponent', picture: 'picture.jpg', attack: 1, lifepoints: 1)
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

  let(:valid_attributes) {
    fight = Fight.battle(valid_battle_attributes)
    {
        character_fights: fight.character_fights
    }
  }

  let(:invalid_attributes) {
    {not_valid: 'not_valid'}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FightsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      fight = Fight.create! valid_attributes
      get :index, params: {}, session: valid_session, :format => :json
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      fight = Fight.create! valid_attributes
      get :show, params: {id: fight.to_param}, session: valid_session, :format => :json
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Fight" do
        puts valid_battle_attributes
        expect {
          post :create, params: {fight: valid_battle_attributes}, session: valid_session, :format => :json
        }.to change(Fight, :count).by(1)
      end

      it "renders a JSON response with the new fight" do

        post :create, params: {fight: valid_battle_attributes}, session: valid_session, :format => :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(fight_url(Fight.last))
      end
    end
  end

end
