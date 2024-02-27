require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
  it 'approved organization' do
    @user = create(:user, :organization_approved)
    @ticket = create(:ticket, :region, :resource_category, organization: @user.organization)
    log_in_as @user
    visit dashboard_path
    click_on 'Tickets'
    click_on @ticket.name
    click_on 'Release'
    expect(current_path).to eq dashboard_path
  end
end
