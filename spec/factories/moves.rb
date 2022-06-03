FactoryBot.define do
  factory :move do
    game { nil }
    card { nil }
    coordinates { 1 }
    user { nil }
  end
end
