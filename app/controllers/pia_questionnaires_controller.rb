class PiaQuestionnairesController < ApplicationController
  def index
    @pia_questionnaires = PiaQuestionnaire.order(id: :desc)
  end
end
