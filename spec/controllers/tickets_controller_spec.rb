require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:ticket) { create(:ticket) }

  describe 'GET #new' do
    it { expect(get(:new)).to be_successful }
  end

end
