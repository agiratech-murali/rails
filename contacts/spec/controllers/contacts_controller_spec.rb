# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:user) { User.create(first_name: 'fname', email: 'xyz@anymail.com', password: 'password') }

  describe 'GET #index' do
    it 'listing all contacts' do
      Contact.create(first_name: 'fname', last_name: 'fname', email: 'xyz@anymail.com', phone: '1234567890', user_id: user.try(:id))
      get :index, params: { api_key: user.try(:token) }
      expect(JSON.parse(response.body)['status']).to eq('success')
    end
  end

  describe 'GET #show' do
    it 'valid contact details' do
      contact = Contact.create(first_name: 'fname', last_name: 'fname', email: 'xyz@anymail.com', phone: '1234567890', user_id: user.try(:id))
      get :show, params: { id: contact.try(:id), api_key: user.try(:token) }
      expect(JSON.parse(response.body)['status']).to eq('success')
    end
    it 'invalid contact details' do
      get :show, params: { id: 0, api_key: user.try(:token) }
      expect(JSON.parse(response.body)['status']).to eq('error')
    end
  end

  describe 'POST #create' do
    it 'with valid params' do
      post :create, params: { contact: { first_name: 'fname', last_name: 'fname', email: 'xyz@anymail.com', phone: '123456789', user_id: user.id }, api_key: user.try(:token) }
      expect(JSON.parse(response.body)['status']).to eq('success')
    end

    it 'with invalid params' do
      post :create, params: { contact: { first_name: 'fname', last_name: 'fname' }, api_key: user.try(:token) }
      expect(JSON.parse(response.body)['status']).to eq('error')
    end
  end

  describe 'POST #update' do
    it 'with valid params' do
      contact = Contact.create(first_name: 'fname', last_name: 'fname', email: 'wxyz@anymail.com', phone: '1234567890', user_id: user.try(:id))
      put :update, params: { id: contact.try(:id), contact: { first_name: 'fname' }, api_key: user.try(:token) }
      expect(JSON.parse(response.body)['status']).to eq('success')
    end

    it 'with invalid params' do
      put :update, params: { id: 0, contact: { email: '' }, api_key: user.try(:token) }
      expect(JSON.parse(response.body)['status']).to eq('error')
    end
  end

  describe 'Delete #destroy' do
    it 'with valid params' do
      contact = Contact.create(first_name: 'fname', last_name: 'fname', email: 'xyz@anymail.com', phone: '1234567890', user_id: user.try(:id))
      get :show, params: { id: contact.try(:id), api_key: user.try(:token) }
      expect(JSON.parse(response.body)['status']).to eq('success')
    end

    it 'with invalid params' do
      get :show, params: { id: 0, api_key: user.try(:token) }
      expect(JSON.parse(response.body)['status']).to eq('error')
    end
  end
end
