require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
    it 'as organization user' do
        org=create(:organization,:approved)
        user=create(:user,organization:org)
        log_in_as(user)
        visit dashboard_path
        click_on 'Edit Organization'
        fill_in 'Name', with: 'Testing'
        fill_in 'Phone', with: 222-222-2222
        fill_in 'Email', with: 'test@domain.com'
        fill_in 'Description', with: 'test description'
        click_on 'Update Resource'
        expect(current_path).to eq(organizations_path+"/"+org.id.to_s)
        expect(page.body).to have_text('Testing')
        expect(page.body).to have_text(222-222-2222)
        expect(page.body).to have_text('test@domain.com')
        expect(page.body).to have_text('test description')
        #current behavior is bugged but in a manner where it passes this test still
    end
end
