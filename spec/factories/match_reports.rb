FactoryGirl.define do
  factory :match_report do
    match
    player
    report { MatchReport.reports.keys.sample }
  end
end
