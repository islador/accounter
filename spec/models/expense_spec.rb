require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe "user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:expense) { FactoryGirl.create(:expense, user: user) }

    it "returns the user who created the expense" do
      expect(expense.user).to eq(user)
    end
  end
end
