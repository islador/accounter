FactoryGirl.define do
  factory :expense do
    starting_amount "9.99"
    current_amount "9.99"
    name "MyString"
    date_of_income "2015-08-16"
    source "MyString"
    user
  end
end
