FactoryGirl.define do
  factory :transaction do
    amount "9.99"
    bucket
    source_id 1
    source_type "MyString"
  end
end
