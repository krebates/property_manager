# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    Street address "555 Good St."
    City "Great Town"
    State "IL"
    Zip code "12395"
  end
end
