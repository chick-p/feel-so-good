FactoryBot.define do
  factory :score do
    wakeup_on { '2019-04-28' }
    score { 1 }
    reason { 'よく寝た' }
    cause { '早く寝た' }
    user
  end
end
