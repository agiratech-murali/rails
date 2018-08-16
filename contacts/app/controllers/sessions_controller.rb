# frozen_string_literal: true
class SessionsController < ApplicationController
  # Fileter to verify the user session
  before_action :validate_user, only: [:destroy]

  # To create a new session
  # Request Params : email(required), password(required)
  # Result: New session will be created upon valid email & password
  def create
    user = User.where(email: params[:user][:email]).first
    if user && user.authenticate(params[:user][:password])
      user.regenerate_token
      render json: { status: :success, data: user.to_json }
    else
      render json: { status: :error, data: 'Invalid login details' }
    end
  end

  # To destroy existing session
  # Request Params : api_key
  # Result: Session will be destroyed upon valid api_key
  def destroy
    current_user.remove_token
    render json: { status: :success, data: 'Successfully signed out' }
  end
end
