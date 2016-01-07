FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@awesome.com"
  end

  sequence :name do |n|
    "john doe #{n}"
  end

  factory :player do
    name
    position "MyString"
    number_shirt 1
    email
    avatar "MyString"
    provider "MyString"
    uid "MyString"
  end

end
