require 'rails_helper'

RSpec.describe BucketsController, type: :controller do
  describe "index" do
    context "with current_user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:bucket_1) { FactoryGirl.create(:bucket, user: user)}
      let(:bucket_2) { FactoryGirl.create(:bucket, user: user)}
      let(:bucket_3) { FactoryGirl.create(:bucket, user: user)}

      before(:each) do
        sign_in user
      end

      it "returns 200" do
        get "index"
        expect(response.status).to be 200
      end

      it "has a current_user" do
        get "index"
        expect(subject.current_user).to_not be_nil
      end

      it "retrieves all of the user's buckets" do
        get "index"
        expect(assigns(:buckets)).to include(bucket_1, bucket_2, bucket_3)
      end
    end

    context "without current_user" do
      it "redirects the user" do
        get "index"
        expect(response.status).to be 302
      end

      it "redirects the user to the signin page" do
        get "index"
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "show" do
    let(:user) { FactoryGirl.create(:user) }
    let(:bucket) { FactoryGirl.create(:bucket, user: user) }

    context "with current_user" do
      let(:transaction_1) { FactoryGirl.create(:transaction, bucket: bucket) }
      let(:trasnaction_2) { FactoryGirl.create(:transaction, bucket: bucket) }
      before(:each) do
        sign_in user
      end

      it "returns 200" do
        get "show", id: bucket
        expect(response.status).to be 200
      end

      it "has a current_user" do
        get "show", id: bucket
        expect(subject.current_user).to_not be_nil
      end

      it "retrieves the target bucket" do
        get "show", id: bucket
        expect(assigns(:bucket)).to eq bucket
      end

      it "retrieves the target bucket's transactions" do
        get "show", id: bucket
        expect(assigns(:transactions)).to eq [transaction_1, transaction_2]
      end
    end

    context "without current_user" do
      it "redirects the user" do
        get "show", id: bucket
        expect(response.status).to be 302
      end

      it "redirects the user to the signin page" do
        get "show", id: bucket
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
