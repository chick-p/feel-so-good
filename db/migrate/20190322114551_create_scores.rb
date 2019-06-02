# frozen_string_literal: true

class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.date :wakeup_on, null: false
      t.integer :score, null: false
      t.string :reason, limit: 50, null: false
      t.string :cause, limit: 50

      t.timestamps
    end
  end
end
