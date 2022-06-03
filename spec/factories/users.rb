FactoryBot.define do
  factory :user do
    pseudo { "MyString" }
    last_move { "2022-05-01 11:14:26" }
    factory :guest_user do 
      guest { true }
      to_create {|instance| instance.save(validate: false)}
    end
  end
end
