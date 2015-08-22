FactoryGirl.define do
  factory :bucket do
    amount 0.00
    sequence(:name) {|n| "Bucket #{n}"}
    user
  end
end
