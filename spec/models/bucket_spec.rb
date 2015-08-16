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
end
