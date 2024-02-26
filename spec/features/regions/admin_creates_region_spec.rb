require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

    it 'creates region as admin' do
        admin=create(:user, :admin)
        log_in_as(admin)
        visit regions_path
        click_on 'Add Region'
        fill_in 'Name', with: 'Test Region'
        click_on 'Add Region'
        expect(current_path).to eq(regions_path)
        expect(page.body).to have_text('Test Region')
    end
end
