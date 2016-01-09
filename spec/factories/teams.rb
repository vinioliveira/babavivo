FactoryGirl.define do
  factory :team do
    color "MyString"
    name "MyString"
    after(:create) {|team| team.players = [create(:player)]}
  end

end
