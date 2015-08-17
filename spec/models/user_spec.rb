require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  describe "buckets" do
    let(:user_bucket) { FactoryGirl.create(:bucket, user: user) }
    let(:user_2) { FactoryGirl.create(:user) }
    let(:user_2_bucket) { FactoryGirl.create(:bucket, user: user_2) }

    it "returns the user's buckets" do
      expect(user_2.buckets).to eq [user_2_bucket]
    end

    it "does not return other user's buckets" do
      expect(user.buckets).to eq [user_bucket]
    end
  end

  describe "bucket_orders" do
    let(:bucket_order) { FactoryGirl.create(:bucket_order, user: user) }
    let(:other_bucket_order) { FactoryGirl.create(:bucket_order) }

    it "returns the user's bucket_orders" do
      expect(user.bucket_orders).to eq [bucket_order]
    end
  end

  describe "incomes" do
    let(:user_income) { FactoryGirl.create(:income, user: user) }
    let(:other_income) { FactoryGirl.create(:income) }
    it "returns the user's incomes" do
      expect(user.incomes).to eq [user_income]
    end

    it "does not return other user's incomes" do
      expect(user.incomes).to_not eq [other_income]
    end
  end

  describe "expenses" do
    let(:user_expense) { FactoryGirl.create(:expense, user: user) }
    let(:other_expense) { FactoryGirl.create(:expense) }
    it "returns the user's expenses" do
      expect(user.expenses).to eq [user_expense]
    end

    it "does not return other user's expenses" do
      expect(user.expenses).to_not eq [other_expense]
    end
  end

  describe "total" do
    let!(:bucket_1) { FactoryGirl.create(:bucket, amount: 200.00, user: user) }
    let!(:bucket_2) { FactoryGirl.create(:bucket, amount: 200.00, user: user) }

    it "returns the total value of the user's buckets" do
      expect(user.total).to eq BigDecimal.new(400.00, 8)
    end
  end
end
