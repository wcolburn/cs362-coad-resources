require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
    it 'as admin' do
        admin=create(:user, :admin)
        log_in_as(admin)
        resource_category=create(:resource_category, name:'Test')
        visit resource_categories_path
        click_on 'Test'
        click_on 'Delete'
        expect(current_path).to eq(resource_categories_path)
        expect(page.body).to have_text("Category Test was deleted.\nAssociated tickets now belong to the 'Unspecified' category.")
    end
end
