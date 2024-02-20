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


  describe "POST #create" do
    before do
      sign_in admin
    end

    context 'success' do
      let(:params) do
        {
          region: {
            name: 'Bend'
          }
        }
      end
      specify { expect(post(:create, params: params)).to redirect_to regions_path }
    end

    context 'failure' do
      let(:params) do
        {
          region: {
            name: nil
          }
        }
      end
      specify { expect(post(:create, params: params)).to be_successful }
    end
  end


  describe "GET #edit" do
    it "succeeds for admin" do
      sign_in admin
      expect(get(:edit, params: { id: region.id })).to be_successful
    end
  end


  describe "POST #update" do
    before do
      sign_in admin
    end

    context "succeeds" do
      specify { expect(post(:update, params: { id: region.id, region: { name: 'New Name' } })).to redirect_to region }
    end
    context "fails" do
      specify { expect(post(:update, params: { id: region.id, region: { name: "" } })).to have_http_status(:success) }
    end
  end


  describe "POST #destroy" do
    it "succeeds for admin" do
      sign_in admin
      expect(post(:destroy, params: { id: region.id })).to redirect_to regions_path
    end
  end

end
