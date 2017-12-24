require 'rails_helper'

RSpec.describe WeaponsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Weapon. As you add validations to Weapon, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        name: 'weapon',
        picture: 'picture.jpg',
        force: 5
    }
  }

  let(:invalid_attributes) {
    {
        force: 15
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WeaponsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      weapon = Weapon.create! valid_attributes
      get :index, params: {}, session: valid_session, :format => :json
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      weapon = Weapon.create! valid_attributes
      get :show, params: {id: weapon.to_param}, session: valid_session, :format => :json
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Weapon" do
        expect {
          post :create, params: {weapon: valid_attributes}, session: valid_session, :format => :json
        }.to change(Weapon, :count).by(1)
      end

      it "renders a JSON response with the new weapon" do

        post :create, params: {weapon: valid_attributes}, session: valid_session, :format => :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(weapon_url(Weapon.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new weapon" do

        post :create, params: {weapon: invalid_attributes}, session: valid_session, :format => :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
            name: 'newName'
        }
      }

      it "updates the requested weapon" do
        weapon = Weapon.create! valid_attributes
        put :update, params: {id: weapon.to_param, weapon: new_attributes}, session: valid_session, :format => :json
        weapon.reload
        expect(weapon.name).to eq(new_attributes[:name])
      end

      it "renders a JSON response with the weapon" do
        weapon = Weapon.create! valid_attributes

        put :update, params: {id: weapon.to_param, weapon: valid_attributes}, session: valid_session, :format => :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the weapon" do
        weapon = Weapon.create! valid_attributes

        put :update, params: {id: weapon.to_param, weapon: invalid_attributes}, session: valid_session, :format => :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested weapon" do
      weapon = Weapon.create! valid_attributes
      expect {
        delete :destroy, params: {id: weapon.to_param}, session: valid_session, :format => :json
      }.to change(Weapon, :count).by(-1)
    end
  end

end
