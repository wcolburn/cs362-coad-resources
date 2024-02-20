require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
    let(:admin) { create(:user, :admin) }
    let(:organization) { create(:organization) }
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
    end

    describe 'GET #show gives correct permissions' do
        it "succeeds for admin" do
            sign_in admin
            expect(get(:show, params: { id: organization.id })).to be_successful
        end
        it "succeeds for approved user" do
            sign_in organization_approved
            expect(get(:show, params: { id: organization.id })).to be_successful
        end
        it "fails for unapproved user" do
            sign_in organization_unapproved
            expect(get(:show, params: { id: organization.id })).to_not be_successful
        end
    end

    describe 'GET #new fails' do
        it do
            sign_in admin
            expect(get(:new)).to_not be_successful
        end
    end
    describe 'GET #new succeeds' do
        it do
            sign_in organization_unapproved
            expect(get(:new)).to be_successful
        end
    end
    
end