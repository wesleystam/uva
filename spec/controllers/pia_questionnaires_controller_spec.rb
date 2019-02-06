require 'rails_helper'

RSpec.describe PiaQuestionnairesController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      create_list(:pia_questionnaire, 3)
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'when the pia_questionnaire is valid' do
      let(:params) do
        {
          pia_questionnaire: { auditor: '', name: 'Name', participants: '' }
        }
      end

      it 'create the pia_questionnaire' do
        expect { post(:create, params: params) }.to change { PiaQuestionnaire.count }.by(1)
      end
      it 'returns status OK' do
        post :create, params: params
        expect(JSON.parse(response.body)['status']).to eq 'OK'
      end
    end

    context 'when the pia_questionnaire is valid' do
      it 'returns status NOT-OK with errors' do
        post :create, params: { pia_questionnaire: { auditor: '', name: '', participants: '' } }
        json = JSON.parse(response.body)

        expect(json['status']).to eq 'NOT-OK'
        expect(json['errors']).to include 'name'
      end
    end
  end
end
