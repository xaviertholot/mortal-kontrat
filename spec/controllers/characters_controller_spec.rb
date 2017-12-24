require 'rails_helper'

RSpec.describe CharactersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Character. As you add validations to Character, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        name: 'toto',
        lifepoints: 5,
        attack: 5,
        picture: 'toto.jpg'
    }
  }

  let(:invalid_attributes) {
      {
          name: 'toto',
          lifepoints: 13,
          attack: 5,
          picture: 'toto.jpg'
      }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      character = Character.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      character = Character.create! valid_attributes
      get :show, params: {id: character.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Character" do
        expect {
          post :create, params: {character: valid_attributes}, session: valid_session
        }.to change(Character, :count).by(1)
      end

      it "renders a JSON response with the new character" do

        post :create, params: {character: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(character_url(Character.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new character" do

        post :create, params: {character: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
            name: 'toto2',
            lifepoints: 2,
            attack: 8,
            picture: 'toto2.jpg'
        }
      }

      it "updates the requested character" do
        character = Character.create! valid_attributes
        put :update, params: {id: character.to_param, character: new_attributes}, session: valid_session
        character.reload
        expect(character.name).to eq('toto2')
        expect(character.lifepoints).to eq(2)
      end

      it "renders a JSON response with the character" do
        character = Character.create! valid_attributes

        put :update, params: {id: character.to_param, character: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the character" do
        character = Character.create! valid_attributes

        put :update, params: {id: character.to_param, character: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested character" do
      character = Character.create! valid_attributes
      expect {
        delete :destroy, params: {id: character.to_param}, session: valid_session
      }.to change(Character, :count).by(-1)
    end
  end

end
