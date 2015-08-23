require 'rails_helper'

RSpec.describe Income, type: :model do
  describe "user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:income) { FactoryGirl.create(:income, starting_amount: BigDecimal.new(400.00, 8), current_amount: BigDecimal.new(400.00, 8), user: user) }

    it "returns the user who created the income" do
      expect(income.user).to eq(user)
    end

    describe "distribute" do
      let(:bucket) { FactoryGirl.create(:bucket, amount: BigDecimal.new(0, 8)) }
      let(:zero) { BigDecimal.new(0, 8) }

      context "the distribution is greater than the income's current_amount" do
        let(:distribution) { BigDecimal.new(500.00, 8) }


        it "sets the income's current_amount to zero" do
          income.distribute(bucket, distribution)
          income.reload
          expect(income.current_amount).to eq zero
        end

        it "adds the current_amount to the bucket's amount" do
          old_bucket_amount = bucket.amount
          old_current_amount = income.current_amount
          income.distribute(bucket, distribution)
          bucket.reload
          expect(old_bucket_amount + old_current_amount).to eq bucket.amount
        end
      end

      context "the distribution is exactly the same as the current_amount" do
        let(:distribution) { BigDecimal.new(400.00, 8) }

        it "sets the income's current_amount to zero" do
          income.distribute(bucket, distribution)
          income.reload
          expect(income.current_amount).to eq zero
        end

        it "adds the distribution to the bucket's amount" do
          old_bucket_amount = bucket.amount
          income.distribute(bucket, distribution)
          bucket.reload
          expect(old_bucket_amount + distribution).to eq bucket.amount
        end
      end

      context "the distribution is less than the income's current_amount" do
        let(:distribution) { BigDecimal.new(200.00, 8) }
        it "reduces the income's current_amount by the distrubtion" do
          old_current_amount = income.current_amount
          income.distribute(bucket, distribution)
          income.reload
          expect(old_current_amount - distribution).to eq income.current_amount
        end

        it "adds the distrubtion to the bucket's amount" do
          old_bucket_amount = bucket.amount
          income.distribute(bucket, distribution)
          bucket.reload
          expect(old_bucket_amount + distribution).to eq bucket.amount
        end
      end
    end
  end
end
