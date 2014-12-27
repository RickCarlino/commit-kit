FactoryGirl.define do
  factory :tracker do
    user
    name { Faker::Name.title }
  end

end
