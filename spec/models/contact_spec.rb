#contact_spec.rb

require "rails_helper"

describe Contact do
  it "returns a sorted array of results that match" do
    smith = Contact.create(
      firstname: 'John',
      lastname: 'smith',
      email: 'johnsmith@email.com')

    johnson = Contact.create(
      firstname: 'Tim',
      lastname: 'Johnson',
      email: 'tj@roar.com')

    jones = Contact.create(
      firstname: 'Tim',
      lastname: 'Jones',
      email: 'timmy@timmy.com')


    expect(Contact.by_letter("J")).to eq [johnson, jones]
  end

  it "omits results that do not match" do
    smith = Contact.create(
      firstname: 'John',
      lastname: 'smith',
      email: 'johnsmith@email.com')

    johnson = Contact.create(
      firstname: 'Tim',
      lastname: 'Johnson',
      email: 'tj@roar.com')

    jones = Contact.create(
      firstname: 'Tim',
      lastname: 'Jones',
      email: 'timmy@timmy.com')
    expect(Contact.by_letter("J")).not_to include smith
  end













  #first six
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
  it "#name returns a contact's full name as a string" do
    contact = Contact.new(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: 'aaron@aaron.com')
    expect(contact.name).to eq "Aaron Sumner"
  end

end