require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

    it 'as admin' do
        admin=create(:user, :admin)
        log_in_as(admin)
        region=create(:region, name:'Test')
        visit regions_path
        click_on 'Test'
        click_on 'Delete'
        expect(current_path).to eq(regions_path)
        expect(current_path).to_not have_text('Test')
        /expect(current_path).to have_text('Unspecified')/
    end

end
