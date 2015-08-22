FactoryGirl.define do
  factory :income do
    starting_amount "9.99"
    current_amount "9.99"
    name "MyString"
    date_of_income Time.now.to_date
    source "MyString"
    user
  end
end
