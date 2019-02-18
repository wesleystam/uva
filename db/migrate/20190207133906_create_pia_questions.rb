class CreatePiaQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :pia_questions do |t|
      t.text :question
      t.text :description
      t.text :yes_explanation
      t.text :no_explanation
      t.text :yes_measure
      t.text :no_measure
      t.integer :position, default: 0
      t.boolean :yes_to_end, default: false
      t.boolean :no_to_end, default: false
      t.references :yes_next_question, foreign_key: { to_table: :pia_question }
      t.references :no_next_question, foreign_key: { to_table: :pia_question }

      t.timestamps
    end
  end
end
