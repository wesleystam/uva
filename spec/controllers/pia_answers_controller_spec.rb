require 'rails_helper'

RSpec.describe PiaAnswersController, type: :controller do
  describe 'GET #edit' do
    it 'returns http success' do
      pia_answer = create(:pia_answer)
      get :edit, params: { id: pia_answer, pia_questionnaire_id: pia_answer.pia_questionnaire }
      expect(response).to render_template(:edit)
    end
  end
end
