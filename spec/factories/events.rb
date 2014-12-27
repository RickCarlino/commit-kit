FactoryGirl.define do
  factory :event do
    tracker
    after(:build) { |event, _no| event.user = event.tracker.user }
  end
end
