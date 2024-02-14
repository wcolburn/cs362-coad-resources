require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:basic_ticket) { create(:ticket) }
  let(:ticket) { create(:ticket, :region, :resource_category) }
  let(:organization_approved) { create(:user, :organization_approved) }
  let(:organization_unapproved) { create(:user, :organization_unapproved) }

  describe 'GET #new' do
    it { expect(get(:new)).to be_successful }
  end

  describe 'GET #show for approved organization user succeeds' do
    before do
      sign_in organization_approved
    end

    it { expect(get(:show, params: { id: ticket.id })).to be_successful }
  end

  describe 'GET #show for unapproved organization user redirects to dashboard' do
    before do
      sign_in organization_unapproved
    end

    it { expect(get(:show, params: { id: ticket.id })).to redirect_to dashboard_path }
  end

end
