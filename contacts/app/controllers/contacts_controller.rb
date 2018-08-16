# frozen_string_literal: true
class ContactsController < ApplicationController
  # Fileter to verify the user session
  before_action :validate_user
  # Filer to set contacts
  before_action :set_contact, only: [:show, :update, :destroy]

  # Listing contacts
  def index
    contacts = params[:query].present? ? current_user.contact_search(params[:query]) : current_user.contacts
    render json: { status: :success, data: contacts.map(&:to_json) }
  end

  # save/create new contact
  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      render json: { status: :success, data: 'Contact was successfully created' }
    else
      render json: { status: :error, data: @contact.errors }
    end
  end

  # contacts details
  def show
    render json: { status: :success, data: @contact.to_json }
  end

  # save/update existing contact
  def update
    if @contact.update(contact_params)
      render json: { status: :success, data: 'Contact was successfully saved' }
    else
      render json: { status: :error, data: @contact.errors }
    end
  end

  # Destroy contact
  def destroy
    @contact.try(:destroy)
    render json: { status: :success, data: 'Contact was successfully archived' }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = current_user.contacts.friendly.find(params[:id])
    render json: { status: :error, data: 'Contact was not found.' } unless @contact.present?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :address, :organization, :birthday, :circle)
  end
end
