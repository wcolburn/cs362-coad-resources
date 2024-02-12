require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { build(:user)}

    it "exists" do
        User.new
    end

    it "Has an email" do
        expect(user).to respond_to(:email)
    end

    it "Has a role" do
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

    it "Sets default role to organization if undefined" do
        user.role=nil
        user.set_default_role
        expect(user.role).to eq("organization")
    end

    it "to_s returns email" do
        user.email = "jim@gmail.com"
        expect(user.to_s).to eq("jim@gmail.com")
    end
end
