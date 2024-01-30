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

end
