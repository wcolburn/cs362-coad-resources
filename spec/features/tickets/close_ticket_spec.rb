require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
  it 'admin closes ticket' do
    @user = create(:user, :admin)
    @ticket = create(:ticket, :region, :resource_category, closed: false)
    log_in_as @user
    visit dashboard_path
    click_on @ticket.name
    click_on 'Close'
    expect(current_path).to eq dashboard_path
  end
  it 'approved organization closes ticket' do
    @user = create(:user, :organization_approved)
    @ticket = create(:ticket, :region, :resource_category, organization: @user.organization)
    log_in_as @user
    visit dashboard_path
    click_on 'Tickets'
    click_on @ticket.name
    click_on 'Close'
    expect(current_path).to eq dashboard_path
  end
end
