FactoryGirl.define do
  factory :weekly_standing do

    after(:create) do |weekly_standing, evaluator|
      create_list(:match, 4, weekly_standing: weekly_standing)
      create_list(:standing, 4, weekly_standing: weekly_standing)
    end
  end
end
