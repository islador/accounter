require 'rails_helper'

RSpec.describe Income, type: :model do
  describe "user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:income) { FactoryGirl.create(:income, user: user) }

    it "returns the user who created the income" do
      expect(income.user).to eq(user)
    end
  end
end
