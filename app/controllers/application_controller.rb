class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # http_basic_authenticate_with :name => ENV['EDIT_USER'], :password => ENV['EDIT_PASS']

  http_basic_authenticate_with :name => ENV['ADMIN_USER'], :password => ENV['ADMIN_PASS'], :if => :admin_controller?

  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from Exception, with: :error500
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  def error404(e)
    render 'error404', status: 404, formats: [:html]
  end

  def error500(e)
    logger.error [e, *e.backtrace].join("\n")
    render 'error500', status: 500, formats: [:html]
  end

  def after_sign_in_path_for(resource)
    "/dashboard"
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:family_name, :first_name, :phone_number, :company_name, :prefecture, :sex, :email, :password, :password_confirmation, :agreement) }
  end

  def admin_controller?
    self.class < ActiveAdmin::BaseController
  end

end
