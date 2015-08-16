FactoryGirl.define do
  factory :bucket do
    amount 200.00
    sequence(:name) {|n| "Bucket #{n}"}
    user
  end
end
