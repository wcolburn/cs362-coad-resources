require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  it 'approved organization user captures ticket from dashboard' do
    @user = create(:user, :organization_approved)
    @ticket = create(:ticket, :region, :resource_category)
    log_in_as @user
    visit dashboard_path
    click_on 'Tickets'
    click_on @ticket.name
    click_on 'Capture'
    expect(current_path).to eq dashboard_path
  end
end
