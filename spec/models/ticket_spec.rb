require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) {Ticket.new}

  it "has a name" do
    expect(ticket).to respond_to(:name)
  end

  it "has a description" do
    expect(ticket).to respond_to(:description)
  end

  it "has a phone" do
    expect(ticket).to respond_to(:phone)
  end

  it "has closed" do
    expect(ticket).to respond_to(:closed)
  end

  it "belongs to region" do
    should belong_to(:region).class_name("Region")
  end

  it "belongs to resource_category" do
    should belong_to(:resource_category).class_name("ResourceCategory")
  end

  it "belongs to organization" do
    should belong_to(:organization).class_name("Organization")
  end

  it "validates length of name is at least 1 and at most 255" do
    should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
  end

  it "validates length of description is at most 1020" do
    should validate_length_of(:description).is_at_most(1020).on(:create)
  end

  it "validates plausible phone number" do
    should allow_values("31301234123").for(:phone)
    should_not allow_values("123").for(:phone)
    should_not allow_values("12345678910000").for(:phone)
  end

  it "open? returns true if not closed" do
    ticket.closed = false
    expect(ticket.open?).to eq(true)
  end

  it "open? returns false if closed" do
    ticket.closed = true
    expect(ticket.open?).to eq(false)
  end

  it "captured? returns true if organization is not null" do
    ticket.organization = Organization.new
    expect(ticket.captured?).to eq(true)
  end

  it "captured? returns false if organization is not null" do
    expect(ticket.captured?).to eq(false)
  end

end
