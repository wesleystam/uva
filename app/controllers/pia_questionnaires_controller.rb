class PiaQuestionnairesController < ApplicationController
  def index
    @pia_questionnaires = PiaQuestionnaire.order(id: :desc)
  end

  def create
    pia_questionnaire = PiaQuestionnaire.new(create_params)

    if pia_questionnaire.valid? && pia_questionnaire.save
      render json: { status: 'OK' }
    else
      render json: { status: 'NOT-OK', errors: pia_questionnaire.errors.to_hash(full_messages: true) }
    end
  end

  private

  def create_params
    params.require(:pia_questionnaire).permit(:auditor, :name, :participants)
  end
end
