class PiaQuestionnaire < ApplicationRecord
  has_many :pia_answers, dependent: :destroy
  validates_presence_of :name
end
