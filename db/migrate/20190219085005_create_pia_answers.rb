class CreatePiaAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :pia_answers do |t|
      t.string :answer
      t.references :pia_questionnaire, foreign_key: true
      t.references :pia_question, foreign_key: true

      t.timestamps
    end
  end
end
