FactoryGirl.define do
  factory :team do
    color { %w(gree red yellow blue orange).sample }
    name  { "Team #{ [1, 2, 3, 4].sample}" }
    after(:create) {|team| team.players = [create(:player)]}
  end
end
