# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Contact, type: :model do
  # User object
  let(:user) { User.new(first_name: 'fname', email: 'xyz@anymail.com', password: 'password') }

  it 'is invalid without first_name' do
    contact = Contact.new(last_name: 'fname', email: 'xyz@anymail.com', phone: '123456789', user_id: user.try(:id))
    contact.save
    expect(contact).to_not be_valid
  end

  it 'is invalid without last_name' do
    contact = Contact.new(first_name: 'fname', email: 'xyz@anymail.com', phone: '123456789', user_id: user.try(:id))
    contact.save
    expect(contact).to_not be_valid
  end

  it 'is invalid without phone' do
    contact = Contact.new(first_name: 'fname', last_name: 'fname', email: 'xyz@anymail.com', user_id: user.try(:id))
    contact.save
    expect(contact).to_not be_valid
  end

  it 'is invalid without email' do
    contact = Contact.new(first_name: 'fname', last_name: 'fname', phone: '123456789', user_id: user.try(:id))
    contact.save
    expect(contact).to_not be_valid
  end

  it 'is invalid with invalid email' do
    contact = Contact.new(first_name: 'fname', last_name: 'fname', email: 'xyz@anymail', phone: '123456789', user_id: user.try(:id))
    contact.save
    expect(contact).to_not be_valid
  end

  it 'is valid with same email' do
    Contact.new(first_name: 'fname', last_name: 'fname', email: 'xyz@anymail.com', phone: '123456789', user_id: user.try(:id))
    contact = Contact.new(first_name: 'fname', last_name: 'fname', email: 'xyz@anymail.com', phone: '123456789', user_id: user.try(:id))
    contact.save
    expect(contact).to_not be_valid
  end
end
