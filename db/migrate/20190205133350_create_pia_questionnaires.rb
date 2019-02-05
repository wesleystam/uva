class CreatePiaQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :pia_questionnaires do |t|
      t.string :name
      t.string :participants
      t.string :auditor
      t.integer :progress, default: 0

      t.timestamps
    end
  end
end
