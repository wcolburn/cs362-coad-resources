require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:basic_ticket) { create(:ticket) }
  let(:ticket) { create(:ticket, :region, :resource_category) }
  let(:organization_approved) { create(:user, :organization_approved) }
  let(:organization_unapproved) { create(:user, :organization_unapproved) }
  let(:admin) { create(:user, :admin) }
  let(:admin_unapproved) { create(:user, :organization_unapproved, :admin) }


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


  describe 'GET #show for admin user succeeds' do
    before do
      sign_in admin_unapproved
    end

    it { expect(get(:show, params: { id: ticket.id })).to be_successful }
  end


  describe 'POST #create' do
    let(:region) { create(:region) }
    let(:resource_category) { create(:resource_category) }

    context 'success' do
      let(:params) do
        {
          ticket: {
            name: 'Fake Ticket',
            phone: '555-555-5555',
            description: 'Fake Description',
            region_id: region.id,
            resource_category_id: resource_category.id
          }
        }
      end
      specify { expect(post(:create, params: params)).to redirect_to ticket_submitted_path }
    end

    context 'failure' do
      let(:params) do
        {
          ticket: {
            name: nil,
            phone: nil,
            description: nil,
            resource_category_id: nil
          }
        }
      end
      specify { expect(post(:create, params: params)).to be_successful }
    end
  end


  describe 'POST #capture' do
    context 'success' do
      before do
        sign_in(organization_approved)
      end

      it {
        expect(TicketService).to receive(:capture_ticket).and_return(:error)
        post(:capture, params: {id: ticket.id})
        expect(response).to be_successful
      }
    end

    context 'failure' do
      specify { expect(post(:capture, params: { id: ticket.id })).to_not be_successful }

      it 'returns unsuccessful if the user is an unapproved organization' do
        sign_in(organization_unapproved)
        expect(post(:capture, params: { id: ticket.id })).to_not be_successful
      end

      it 'redirects to dashboard if not logged in' do
        post(:capture, params: { id: ticket.id })
        expect(response).to redirect_to(dashboard_path)
      end

      it 'admins return to dashboard' do
        sign_in(admin)
        expect(post(:capture, params: { id: ticket.id })).to redirect_to(dashboard_path)
      end
    end

  end



end
