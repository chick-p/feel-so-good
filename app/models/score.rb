class Score < ApplicationRecord
  with_options presence: true do
    validates :wakeup_on
    validates :score
    validates :reason
  end
  with_options length: {maximum: 50} do
    validates :reason
    validates :cause
  end

  belongs_to :user
end
