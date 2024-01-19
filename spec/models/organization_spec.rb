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

  # TODO: Add tests for attr_accesor
end
