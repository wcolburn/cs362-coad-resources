require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { Organization.new}

  it "has a name" do
    expect(organization).to respond_to(:name)
  end

  it "has a status" do
    expect(organization).to respond_to(:status)
  end

  it "has a phone" do
    expect(organization).to respond_to(:phone)
  end

  it "has an email" do
    expect(organization).to respond_to(:email)
  end

  it "has a description" do
    expect(organization).to respond_to(:description)
  end

  it "has a liability insurance" do
    expect(organization).to respond_to(:liability_insurance)
  end

  it "has a rejection reason" do
    expect(organization).to respond_to(:rejection_reason)
  end

  it "has a primary name" do
    expect(organization).to respond_to(:primary_name)
  end

  it "has a secondary name" do
    expect(organization).to respond_to(:secondary_name)
  end

  it "has a secondary phone" do
    expect(organization).to respond_to(:secondary_phone)
  end

  it "has a title" do
    expect(organization).to respond_to(:title)
  end

  it "has a transportation" do
    expect(organization).to respond_to(:transportation)
  end

  it "has an agreement_one" do
    expect(organization).to respond_to(:agreement_one)
  end

  it "has an agreement_two" do
    expect(organization).to respond_to(:agreement_two)
  end

  it "has an agreement_three" do
    expect(organization).to respond_to(:agreement_three)
  end

  it "has an agreement_four" do
    expect(organization).to respond_to(:agreement_four)
  end

  it "has an agreement_five" do
    expect(organization).to respond_to(:agreement_five)
  end

  it "has an agreement_six" do
    expect(organization).to respond_to(:agreement_six)
  end

  it "has an agreement_seven" do
    expect(organization).to respond_to(:agreement_seven)
  end

  it "has an agreement_eight" do
    expect(organization).to respond_to(:agreement_eight)
  end

  it "has and belongs to resource_categories" do
    should have_and_belong_to_many(:resource_categories).class_name("ResourceCategory")
  end

  it "has many users" do
    should have_many(:users).class_name("User")
  end

  it "has many tickets" do
    should have_many(:tickets).class_name("Ticket")
  end

  it "validates length of email is at least 1 and at most 255" do
    should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
  end

  it "validates format of email" do
    should allow_values("email@provider.com").for(:email)
    should_not allow_values("email@provider").for(:email)
    should_not allow_values("email.com").for(:email)
    should_not allow_values("@provider.com").for(:email)
  end

  it "validates uniqueness of email" do
    should validate_uniqueness_of(:email).case_insensitive
  end

  it "validates length of name is at least 1 and at most 255" do
    should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
  end

  it "validates uniqueness of name" do
    should validate_uniqueness_of(:name).case_insensitive
  end

  it "validates length of description is at most 1020" do
    should validate_length_of(:description).is_at_most(1020).on(:create)
  end

  it "sets status to approved" do
    organization.approve
    expect(organization.status).to eq("approved")
  end



end
