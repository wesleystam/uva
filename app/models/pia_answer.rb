class PiaAnswer < ApplicationRecord
  belongs_to :pia_questionnaire
  belongs_to :pia_question
end
