require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  let(:admin) { create(:user, :admin) }
  let(:user) { create(:user, :organization_approved) }

  describe "GET #index" do
    it "get as admin" do
      sign_in admin
      expect(get(:index)).to be_successful
    end

    it "cannot get as regular user" do
      sign_in user
      expect(get(:index)).to redirect_to(dashboard_path)
    end
  end

end
