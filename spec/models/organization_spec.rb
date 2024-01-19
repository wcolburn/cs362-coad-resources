require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { Organization.new}

  it "has a name" do
    expect(organization).to respond_to(:name)
  end

end
