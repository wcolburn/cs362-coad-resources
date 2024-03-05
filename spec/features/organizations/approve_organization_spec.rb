require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

    it 'as admin' do
        admin=create(:user, :admin)
        log_in_as(admin)
        create(:organization, :unapproved, name:'Test')
        visit organizations_path
        click_on 'Pending'
        click_on 'Review'
        click_on 'Approve'
        expect(current_path).to eq(organizations_path)
        expect(page.body).to have_text('Organization Test has been approved.')
    end
end
