require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  it "returns admin dashboard for admin user" do
    admin = create(:user, :admin)
    expect(helper.dashboard_for(admin)).to eq('admin_dashboard')
  end
  it "returns submitted dashboard for submitted user" do
    user = create(:user, :organization_submitted)
    expect(helper.dashboard_for(user)).to eq('organization_submitted_dashboard')
  end
end