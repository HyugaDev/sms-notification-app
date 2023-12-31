# frozen_string_literal: true

module Users
  # Devise's registration controller
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[phone_number name])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[phone_number name])
    end
  end
end
