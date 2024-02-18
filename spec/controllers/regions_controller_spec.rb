require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  let(:region) { create(:region) }
  let(:admin) { create(:user, :admin) }
  let(:organization_approved) { create(:user, :organization_approved) }
  let(:organization_unapproved) { create(:user, :organization_unapproved) }

  describe "GET #index" do
    it "get as admin" do
      sign_in admin
      expect(get(:index)).to be_successful
    end

    it "cannot get as regular user" do
      sign_in organization_approved
      expect(get(:index)).to redirect_to(dashboard_path)
    end
  end

  describe 'GET #new' do
    it do
      sign_in admin
      expect(get(:new)).to be_successful
    end
  end

  describe 'GET #show for admin user succeeds' do
    it "succeeds for admin" do
      sign_in admin
      expect(get(:show, params: { id: region.id })).to be_successful
    end
    it "fails for regular user" do
      sign_in organization_approved
      expect(get(:show, params: { id: region.id })).to_not be_successful
    end
  end
end
