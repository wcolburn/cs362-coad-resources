require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
    let(:admin) { create(:user, :admin) }
    let(:organization_approved) { create(:user, :organization_approved) }
    let(:organization_unapproved) { create(:user, :organization_unapproved) }

    describe "GET #index" do
        it "get as admin" do
            sign_in admin
            expect(get(:index)).to be_successful
        end

        it "get as approved user" do
            sign_in organization_approved
            expect(get(:index)).to be_successful
        end

        it "get as unapproved user" do
            sign_in organization_unapproved
            expect(get(:index)).to be_successful
        end
        
        it "get while logged out" do
            expect(get(:index)).to redirect_to(new_user_session_path)
        end
    end
end
