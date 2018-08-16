# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # valdating user based on token
  def validate_user
    token = params['api_key'] || request.env['HTTP_API_KEY']
    @user = User.find_by token: token if token.present?
    render json: { status: :error, data: 'Invalid Api Key' } unless @user.present?
  end

  # Access currently logged in uset
  def current_user
    @user
  end
end
