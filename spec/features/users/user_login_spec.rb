require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  it 'logs in from dashboard' do
    @user = create(:user, password: "testpassword")
    visit dashboard_path
    click_on 'Log in'
    fill_in "Email address", with: @user.email
    fill_in "Password", with: "testpassword"
    click_on 'Sign in'
    expect(current_path).to eq dashboard_path
  end
end
