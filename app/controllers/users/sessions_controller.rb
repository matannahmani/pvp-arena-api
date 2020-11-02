# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json
  private

  def respond_with(resource, _opts = {})
    if !current_user.nil?
      render json: {
      status: {code: 200, message: 'Logged in successfully.'},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }
    else
      render json: {code: 401, message: 'Email or password is invaild'}
    end
  end

  def respond_to_on_destroy
    head :ok
  end
end
