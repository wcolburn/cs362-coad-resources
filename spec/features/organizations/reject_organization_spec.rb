require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do

    it 'as admin' do
        admin=create(:user, :admin)
        log_in_as(admin)
        create(:organization, :unapproved, name:'Test')
        visit organizations_path
        click_on 'Pending'
        click_on 'Review'
        fill_in 'Rejection Reason', with: 'reasoning'
        click_on 'Reject'
        expect(current_path).to eq(organizations_path)
        expect(page.body).to have_text('Organization Test has been rejected.')
        expect(page.body).to have_text('reasoning')
    end
end
