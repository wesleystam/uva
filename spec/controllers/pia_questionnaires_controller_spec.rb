require 'rails_helper'

RSpec.describe PiaQuestionnairesController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      create_list(:pia_questionnaire, 3)
      get :index
      expect(response).to render_template(:index)
    end
  end
end
