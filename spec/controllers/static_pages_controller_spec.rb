require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
    let(:admin) { create(:user, :admin) }
    let(:organization_approved) { create(:user, :organization_approved) }
    let(:organization_unapproved) { create(:user, :organization_unapproved) }

end
