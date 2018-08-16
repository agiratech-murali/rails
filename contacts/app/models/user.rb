# frozen_string_literal: true
class User < ApplicationRecord
  # authenticate against a BCrypt password
  has_secure_password
  # token authentication
  has_secure_token

  # model validations
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false

  # Associations
  has_many :contacts, dependent: :destroy

  # To form json data
  def to_json
    {
      first_name: first_name,
      last_name: last_name,
      email: email,
      api_key: token
    }
  end

  def contact_search(query)
    query = "%#{query}%"
    contacts.where('first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR phone ILIKE ?', query, query, query, query)
  end

  # To destroy the session token
  def remove_token
    update(token: nil)
  end
end
