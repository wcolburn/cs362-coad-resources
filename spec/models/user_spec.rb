require 'rails_helper'

RSpec.describe User, type: :model do

    it "exists" do
        User.new
    end

    it "Has an email" do
        user = User.new
        expect(user).to respond_to(:email)
    end

    it "Has a role" do
        user = User.new
        expect(user).to respond_to(:role)
    end

    it "Belongs to Organization" do
        should belong_to(:organization).class_name("Organization").optional
    end

    it "Validate presence of email" do
        should validate_presence_of(:email)
    end

    it "Validates length of email is at least 1 and at most 255" do
        should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
    end

    it "validates format of email" do
        should allow_values("email@provider.com").for(:email)
        should_not allow_values("email@provider").for(:email)
        should_not allow_values("email.com").for(:email)
        should_not allow_values("@provider.com").for(:email)
    end

    it "Validates uniqueness of email" do
        should validate_uniqueness_of(:email).case_insensitive
    end

    it "Validate presence of password" do
        should validate_presence_of(:password)
    end

    it "Validates length of password is at least 7 and at most 255" do
        should validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create)
    end
end
