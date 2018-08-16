# frozen_string_literal: true
class UsersController < ApplicationController
  # Fileter to verify the user session
  before_action :validate_user, only: [:destroy]
  # To create a new user
  # Request Params : first_name, last_name, email(required), password(required)
  # Result: New user will be added
  def create
    user = User.new(user_params)
    if user.save
      render json: { status: :success, data: user.to_json }
    else
      render json: { status: :error, data: user.errors }
    end
  end

  # To archive the user
  # Request Params : id
  # Result: New user will be added
  def destroy
    current_user.destroy
    render json: { status: :success }
  end

  private

  # Permit params to save user
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
