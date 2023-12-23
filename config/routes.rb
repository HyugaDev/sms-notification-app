# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sms_logs, only: [:index]
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'sms_logs#index'
end
