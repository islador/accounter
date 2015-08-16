require 'rails_helper'

RSpec.describe Bucket, type: :model do
  describe "user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:bucket) { FactoryGirl.create(:bucket, user: user) }

    it "returns the user" do
      expect(bucket.user).to be user
    end
  end
end
