# frozen_string_literal: true
class Contact < ApplicationRecord
  # friendlyId / Slug
  extend FriendlyId
  friendly_id :email, use: [:slugged, :finders]

  # Associations
  belongs_to :user
  # Validations
  validates :first_name, :last_name, :phone, presence: true
  validates :phone, numericality: true
  validate :check_email

  # To form json data
  def to_json
    {
      first_name: first_name,
      last_name: last_name,
      email: email,
      phone: phone,
      address: address,
      birthday: birthday,
      circle: circle,
      created_at: created_at,
      slug: slug
    }
  end

  protected

  def check_email
    if email.blank?
      errors.add(:email, 'Email is required to save your contacts')
    else
      check_email_format
    end
  end

  # Check Email addresses between contacts must be unique
  def check_email_format
    if !(email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
      errors.add(:email, 'Invalid email format')
    elsif email_changed? && Contact.exists?(email: email, user_id: user_id)
      errors.add(:email, 'Email is already added into your contacts')
    end
  end
end
