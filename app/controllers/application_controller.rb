require "application_responder"

class ApplicationController < ActionController::Base
  check_authorization :unless => :devise_controller?
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  respond_to :html, :json

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to questions_path, alert: exception.message
  end

end
