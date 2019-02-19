class PiaQuestionnairesController < ApplicationController
  def index
    @pia_questionnaires = PiaQuestionnaire.order(id: :desc)
  end

  def create
    pia_questionnaire = PiaQuestionnaire.new(create_params)

    if pia_questionnaire.valid? && pia_questionnaire.save
      PiaQuestion.all.each do |pia_question|
        pia_questionnaire.pia_answers.create(pia_question: pia_question)
      end
      render json: { status: 'OK' }
    else
      render json: { status: 'NOT-OK', errors: pia_questionnaire.errors.to_hash(full_messages: true) }
    end
  end

  def show
    pia_questionnaire = PiaQuestionnaire.find(params[:id])
    pia_answer = pia_questionnaire.pia_answers.first
    redirect_to edit_pia_questionnaire_pia_answer_path(pia_questionnaire, pia_answer)
  end

  private

  def create_params
    params.require(:pia_questionnaire).permit(:auditor, :name, :participants)
  end
end
