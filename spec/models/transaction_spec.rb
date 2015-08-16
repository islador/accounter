require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "transaction" do
    let(:bucket) { FactoryGirl.create(:bucket) }
    let(:transaction) { FactoryGirl.create(:transaction, bucket: bucket) }

    describe "bucket" do
      it "returns the bucket which this transaction took place with" do
        expect(transaction.bucket).to be bucket
      end
    end

    describe "expense transaction" do
      xit "returns the expense associated with the transaction" do
      end
    end

    describe "income transaction" do
      xit "returns the income associated with the transaction" do
      end
    end
  end
end
