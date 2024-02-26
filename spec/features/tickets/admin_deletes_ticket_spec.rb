require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  before do
    @ticket = create(:ticket, :region, :resource_category)
    @admin = create(:user, :admin)
  end

  it 'can be deleted by admin at dashboard' do
    log_in_as @admin
    visit dashboard_path
    click_on @ticket.name
    click_on 'Delete'
    expect(current_path).to eq dashboard_path
    expect(page.body).to_not have_text(@ticket.name)
  end
end
