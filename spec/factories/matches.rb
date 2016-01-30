FactoryGirl.define do
  factory :match do
    association :first_team, factory: :team
    association :second_team, factory: :team
    weekly_standing
    first_team_score { [1,2].sample }
    second_team_score { [1,2].sample }
  end
end
