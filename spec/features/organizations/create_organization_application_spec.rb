require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do

    before do
        @org=create(:organization, :unapproved, name:'Test')
    end

    it 'as admin' do
        admin=create(:user, :admin)
        log_in_as(admin)
        visit organizations_path
        click_on 'Pending'
        click_on 'Review'
        click_on 'Approve'
        expect(current_path).to eq(organizations_path)
        click_on 'Approved'
    end
end
