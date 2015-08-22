require 'rails_helper'

RSpec.describe Bucket, type: :model do
  describe "user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:bucket) { FactoryGirl.create(:bucket, user: user) }

    it "returns the user" do
      expect(bucket.user).to be user
    end
  end

  describe "transaction" do
    let(:bucket) { FactoryGirl.create(:bucket) }
    let(:transaction_1) { FactoryGirl.create(:transaction, bucket: bucket) }
    let(:transaction_2) { FactoryGirl.create(:transaction, bucket: bucket) }

    it "returns the bucket's transactions" do
      expect(bucket.transactions).to eq [transaction_1, transaction_2]
    end
  end

  describe "bucket_order" do
    let(:bucket_order) { FactoryGirl.create(:bucket_order)}
    let(:bucket) { FactoryGirl.create(:bucket, bucket_order: bucket_order) }

    it "returns the bucket order this bucket is associated with" do
      expect(bucket.bucket_order).to eq bucket_order
    end
  end
end
