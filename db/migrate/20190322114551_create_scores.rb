class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.date :wakeup_on
      t.integer :score
      t.string :reason
      t.string :cause

      t.timestamps
    end
  end
end
