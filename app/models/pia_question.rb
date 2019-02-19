class PiaQuestion < ApplicationRecord
  belongs_to :yes_next_question, class_name: 'PiaQuestion', optional: true
  belongs_to :no_next_question, class_name: 'PiaQuestion', optional: true
  has_many :pia_answers, dependent: :destroy
end
