require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { build(:ticket)}
  let(:db_region_1) { create(:region) }
  let(:db_resource_category_1) { create(:resource_category) }
  let(:db_region_2) { create(:region) }
  let(:db_resource_category_2) { create(:resource_category) }

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

  it "captured? returns false if organization is null" do
    expect(ticket.captured?).to eq(false)
  end

  it "to_s returns a string with the ticket id" do
    expect(ticket.to_s).to eq("Ticket #{ticket.id}")
  end

  it "closed scope method returns all closed Tickets" do
    closed_ticket = create(:ticket, closed:true, region_id:db_region_1.id, resource_category_id:db_resource_category_1.id)
    open_ticket = create(:ticket, closed:false, region_id:db_region_2.id, resource_category_id:db_resource_category_2.id)
    expect(Ticket.closed).to eq([closed_ticket])
  end

  it "open scope method returns all opened Tickets" do
    closed_ticket = create(:ticket, closed:true, region_id:db_region_1.id, resource_category_id:db_resource_category_1.id)
    open_ticket = create(:ticket, closed:false, region_id:db_region_2.id, resource_category_id:db_resource_category_2.id)
    expect(Ticket.open).to eq([open_ticket])
  end

  it "all_organization returns all open tickets with a valid organization" do
    org = create(:organization)
    open_ticket_with_org = create(:ticket, closed:false, region_id:db_region_1.id, resource_category_id:db_resource_category_1.id, organization_id: org.id)
    open_ticket_without_org = create(:ticket, closed:false, region_id:db_region_2.id, resource_category_id:db_resource_category_2.id)
    closed_ticket_with_org = create(:ticket, closed:true, region_id:db_region_2.id, resource_category_id:db_resource_category_2.id, organization_id: org.id)
    expect(Ticket.all_organization).to eq([open_ticket_with_org])
  end

  it "organization returns all open tickets that match the given id" do
    org1 = create(:organization)
    org2 = create(:organization)
    open_ticket_with_org1 = create(:ticket, closed:false, region_id:db_region_1.id, resource_category_id:db_resource_category_1.id, organization_id: org1.id)
    open_ticket_with_org2 = create(:ticket, closed:false, region_id:db_region_2.id, resource_category_id:db_resource_category_2.id, organization_id: org2.id)
    closed_ticket_with_org1 = create(:ticket, closed:true, region_id:db_region_1.id, resource_category_id:db_resource_category_1.id, organization_id: org1.id)
    expect(Ticket.organization org1.id).to eq([open_ticket_with_org1])
  end

  it "closed_organization returns all closed tickets that match the given id" do
    org1 = create(:organization)
    org2 = create(:organization)
    open_ticket_with_org1 = create(:ticket, closed:false, region_id:db_region_1.id, resource_category_id:db_resource_category_1.id, organization_id: org1.id)
    closed_ticket_with_org2 = create(:ticket, closed:true, region_id:db_region_2.id, resource_category_id:db_resource_category_2.id, organization_id: org2.id)
    closed_ticket_with_org1 = create(:ticket, closed:true, region_id:db_region_1.id, resource_category_id:db_resource_category_1.id, organization_id: org1.id)
    expect(Ticket.closed_organization org1.id).to eq([closed_ticket_with_org1])
  end

  it "region returns all tickets that match the given region id" do
    open_ticket_with_region1 = create(:ticket, closed:false, region_id:db_region_1.id, resource_category_id:db_resource_category_1.id)
    open_ticket_with_region2 = create(:ticket, closed:false, region_id:db_region_2.id, resource_category_id:db_resource_category_2.id)
    closed_ticket_with_region1 = create(:ticket, closed:true, region_id:db_region_1.id, resource_category_id:db_resource_category_1.id)
    expect(Ticket.region db_region_1.id).to eq([open_ticket_with_region1, closed_ticket_with_region1])
  end

  it "resource_category returns all tickets that match the given resource_category id" do
    r1 = Region.create!(name:"Bend")
    rc1 = ResourceCategory.create!(name:"Food")
    t1 = Ticket.create!(closed:false, name:"Closed Ticket", phone:"31301234123", region_id:r1.id, resource_category_id:rc1.id)
    r2 = Region.create!(name:"Redmond")
    rc2 = ResourceCategory.create!(name:"Water")
    t2 = Ticket.create!(closed:false, name:"Open Ticket", phone:"31301234123", region_id:r2.id, resource_category_id:rc2.id)
    expect(Ticket.resource_category rc1.id).to eq([t1])
  end

end
