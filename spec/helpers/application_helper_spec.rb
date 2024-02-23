require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe "test full_title" do
    it { expect(helper.full_title()).to eq 'Disaster Resource Network' }
  end

  describe "test full_title with specific page title" do
    it { expect(helper.full_title('Central Oregon')).to eq 'Central Oregon | Disaster Resource Network' }
  end

end
