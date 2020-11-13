# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :attendees
  devise_for :users, path: :admin

  # root to: 'home#index'

  get 'admin' => 'admin/workshops#index'
  namespace :admin do
    resources :workshops
  end

  resources :enrollments, only: [] do
    post :waiting_list_create, to: 'enrollments#waiting_list_create', as: 'waiting_list', on: :collection
  end
end
