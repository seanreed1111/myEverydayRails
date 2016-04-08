#contact_spec.rb

require "rails_helper"

describe Contact do
  it "is valid with a firstname, lastname and email" do
    contact = Contact.new(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: 'tester@test.com')
    expect(contact).to be_valid
  end

  it "is invalid without a firstname" do
    contact = Contact.new(
      firstname: nil,
      lastname: 'Sumner',
      email: 'tester@test.com')
    expect(contact).not_to be_valid
  end

  it "is invalid without a lastname" do
    contact = Contact.new(
      firstname: 'Aaron',
      lastname: nil,
      email: 'tester@test.com')
    expect(contact).not_to be_valid
  end
  it "is invalid without a email address" do
    contact = Contact.new(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: nil)
    expect(contact).not_to be_valid
  end

  it "is invalid with a duplicate email address" do
    contact = Contact.create(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: 'aaron@aaron.com')

    duplicateEmail = Contact.new(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: 'aaron@aaron.com')
    expect(duplicateEmail).not_to be_valid
  end
  it "returns a contact's full name as a string"
end