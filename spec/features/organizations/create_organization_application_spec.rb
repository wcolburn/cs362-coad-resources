require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
    it 'as unapproved organization user' do
        user=create(:user)
        log_in_as(user)
        click_on 'Create Application'
        /choose('organization[liability_insurance]', option: 'Yes')
        choose('organization[agreement_one]', option: 'I agree')
        choose('organization[agreement_two]', option: 'I agree')
        choose('organization[agreement_three]', option: 'I agree')
        choose('organization[agreement_four]', option: 'I agree')
        choose('organization[agreement_five]', option: 'I agree')
        choose('organization[agreement_six]', option: 'I agree')
        choose('organization[agreement_seven]', option: 'I agree')
        choose('organization[agreement_eight]', option: 'I agree')/
        fill_in 'Organization Name', with: 'test org'
        click_on 'Apply'
    end
end
