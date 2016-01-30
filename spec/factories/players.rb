FactoryGirl.define do
  factory :player do
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:name) { |n| "John Doe #{n}" }
    position "MyString"
    sequence(:number_shirt) { |n| n }
    avatar "MyString"
    provider "MyString"
    uid "MyString"
  end
end
