# frozen_string_literal: true

class ApplicationController < ActionController::Base

  # layout :resolve_layout

  protected

  def resolve_layout
    
    if devise_controller? && resource_name == :user
      'admin'
    elsif devise_controller? && resource_name == :attendee
      'home'
    else
      'admin'
    end

  end
end
