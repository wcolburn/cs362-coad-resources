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

  # TODO: Add tests for attr_accesor
end
