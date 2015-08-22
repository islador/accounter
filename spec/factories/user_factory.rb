FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "fake_email_#{n}@fake.com"}
    password "fakepassword"
  end
end
