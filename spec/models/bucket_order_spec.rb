require 'rails_helper'

RSpec.describe BucketOrder, type: :model do
  describe "user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:bucket_order) { FactoryGirl.create(:bucket_order, user: user) }

    it "returns the user who owns the bucket order" do
      expect(bucket_order.user).to eq user
    end
  end

  describe "buckets" do
    let(:user) { FactoryGirl.create(:user) }
    let(:bucket_1) { FactoryGirl.create(:bucket, user: user, bucket_order: bucket_order) }
    let(:bucket_2) { FactoryGirl.create(:bucket, user: user, bucket_order: bucket_order) }
    let(:bucket_order) { FactoryGirl.create(:bucket_order, user: user) }

    it "returns the buckets associated with this bucket order" do
      expect(bucket_order.buckets).to eq [bucket_1, bucket_2]
    end
  end

  describe "distribute_to_buckets" do
    let(:user) { FactoryGirl.create(:user) }
    let(:bucket_order) { FactoryGirl.create(:bucket_order, user: user, distribution: [100.00, 50.00, 100.00])}
    let(:bucket_1) { FactoryGirl.create(:bucket, user: user, bucket_order: bucket_order) }
    let(:bucket_2) { FactoryGirl.create(:bucket, user: user, bucket_order: bucket_order) }
    let(:bucket_3) { FactoryGirl.create(:bucket, user: user, bucket_order: bucket_order) }

    before do
      bucket_order.bucket_order << bucket_1
      bucket_order.bucket_order << bucket_2
      bucket_order.bucket_order << bucket_3
    end

    context "with income" do
      let(:income) { FactoryGirl.create(:income, starting_amount: BigDecimal.new(200.00, 8)) }

      it "adds the income to each bucket" do
        bucket_order.distribute_to_buckets(income)
        bucket_1.reload; bucket_2.reload; bucket_3.reload
        expect(bucket_1.amount).to be > BigDecimal.new(0.00,8)
        expect(bucket_2.amount).to be > BigDecimal.new(0.00,8)
        expect(bucket_3.amount).to be > BigDecimal.new(0.00,8)
      end

      it "adds the income to each bucket in order of priority" do
        bucket_order.distribute_to_buckets(income)
        bucket_1.reload; bucket_2.reload; bucket_3.reload
        expect(bucket_1.amount).to eq BigDecimal.new(100.00,8)
        expect(bucket_2.amount).to eq BigDecmial.new(50.00,8)
        expect(bucket_3.amount).to eq BigDecimal.new(50.00,8)
      end

      it "adds the remainder of the income to the last bucket regardless of that bucket's distribution" do
        income.starting_amount = BigDecimal.new(300.00,8)
        bucket_order.distribute_to_buckets(income)
        bucket_1.reload; bucket_2.reload; bucket_3.reload
        expect(bucket_1.amount).to eq BigDecimal.new(100.00,8)
        expect(bucket_2.amount).to eq BigDecmial.new(50.00,8)
        expect(bucket_3.amount).to eq BigDecimal.new(150.00,8)
      end
    end

    context "with expense" do
      let(:expense) { FactoryGirl.create(:expense, starting_amount: BigDecimal.new(200.00,8))}

      before do
        bucket_1.amount = BigDecimal.new(200.00,8)
        bucket_2.amount = BigDecimal.new(50.00,8)
        bucket_3.amount = BigDecimal.new(50.00,8)
      end

      it "adds the expense to each bucket" do
        bucket_order.distribute_to_buckets(expense)
        bucket_1.reload; bucket_2.reload; bucket_3.reload
        expect(bucket_1.amount).to be < BigDecimal.new(200.00,8)
        expect(bucket_2.amount).to be < BigDecmial.new(200.00,8)
        expect(bucket_3.amount).to be < BigDecimal.new(200.00,8)
      end

      it "adds the expense to each bucket in order of priority" do
        bucket_order.distribute_to_buckets(expense)
        bucket_1.reload; bucket_2.reload; bucket_3.reload
        expect(bucket_1.amount).to eq BigDecimal.new(100.00,8)
        expect(bucket_2.amount).to eq BigDecmial.new(50.00,8)
        expect(bucket_3.amount).to eq BigDecimal.new(50.00,8)
      end

      it "adds the remainder of the expense to the first bucket regardless of that bucket's distribution" do
        expense.starting_amount = BigDecimal.new(350.00,8)
        bucket_order.distribute_to_buckets(expense)
        bucket_1.reload; bucket_2.reload; bucket_3.reload
        expect(bucket_1.amount).to eq BigDecimal.new(-50.00,8)
        expect(bucket_2.amount).to eq BigDecmial.new(0.00,8)
        expect(bucket_3.amount).to eq BigDecimal.new(0.00,8)
      end
    end
  end
end
