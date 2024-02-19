require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
    let(:admin) { create(:user, :admin) }
    let(:resource_category) { create(:resource_category) }
    let(:organization_approved) { create(:user, :organization_approved) }
    let(:organization_unapproved) { create(:user, :organization_unapproved) }

    describe "GET #index" do
        it "get as admin" do
            sign_in admin
            expect(get(:index)).to be_successful
        end

        it "cannot get as approved user" do
            sign_in organization_approved
            expect(get(:index)).to redirect_to(dashboard_path)
        end
    end

    describe 'GET #show for admin user succeeds' do
        it "succeeds for admin" do
            sign_in admin
            expect(get(:show, params: { id: resource_category.id })).to be_successful
        end
        it "fails for regular user" do
            sign_in organization_approved
            expect(get(:show, params: { id: resource_category.id })).to_not be_successful
        end
    end

    describe 'GET #new' do
        it do
            sign_in admin
            expect(get(:new)).to be_successful
        end
    end

    describe "POST #destroy" do
        it "admin destroys a resource_category" do
            sign_in admin
            post(:destroy, params: { id: resource_category.id })
            expect(response).to redirect_to ('/resource_categories')
            expect(flash[:notice]).to match(/Category #{resource_category.name} was deleted.\nAssociated tickets now belong to the 'Unspecified' category.*/)
        end
    end
end
