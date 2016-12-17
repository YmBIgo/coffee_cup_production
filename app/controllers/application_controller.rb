class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # http_basic_authenticate_with :name => ENV['EDIT_USER'], :password => ENV['EDIT_PASS']

  # http_basic_authenticate_with :name => ENV['COFFEE_USER'], :password => ENV['COFFEE_PASS']

  # before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from Exception, with: :error500
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  before_action :set_locale

  # after_action  :record_log

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def record_log
    # if user_signed_in?
    #   Viewlist.create(:lang => I18n.locale, :page_type => request.url, :user_id => current_user.id, :watching_ip => request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip, :referer => referer_str, :user_agent => request.env["HTTP_USER_AGENT"])
    # else
    #   Viewlist.create(:lang => I18n.locale, :page_type => request.url, :user_id => 0, :watching_ip => request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip, :referer => referer_str, :user_agent => request.env["HTTP_USER_AGENT"])
    # end
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def error404(e)
    render 'error404', status: 404, formats: [:html]
    Viewlist.create(:lang => "404", :page_type => request.url, :user_id => 0, :watching_ip => request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip, :referer => referer_str, :user_agent => request.env["HTTP_USER_AGENT"])
  end

  def error500(e)
    logger.error [e, *e.backtrace].join("\n")
    render 'error500', status: 500, formats: [:html]
    Viewlist.create(:lang => "500", :page_type => request.url, :user_id => 0, :watching_ip => request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip, :referer => referer_str, :user_agent => request.env["HTTP_USER_AGENT"])
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def referer_str
    if request.referer != nil
      request.referer
    else
      "no"
    end
  end

end
