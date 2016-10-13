class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :basic_auth, :if => :check_company?, :only => [:edit, :update, :destroy, :cancel]
  after_action :send_create_user_mail, :only => [:create]

# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    unless current_user.company?
      super
    else
      update_signin_ip
    end
  end

  # PUT /resource
  def update
    unless current_user.company?
      super
    else
      update_signin_ip
    end
  end

  # DELETE /resource
  def destroy
    unless current_user.company?
      super
    else
      update_signin_ip
    end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    unless current_user.company?
      super
    else
      update_signin_ip
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  # authenticate

  def basic_auth
    authenticate_or_request_with_http_basic do |user, pass|
      user == company_logname && pass == company_pass
    end
  end

  def check_company?
    if current_user.company != nil
      return true
    else
      return false
    end
  end

  def company_logname
    return current_user.company.log_name
  end

  def company_pass
    return current_user.company.password
  end

  # redirect
  def back_to_dashboard
    redirect_to dashboard_path
    flash[:alert] = "編集権限はありません"
  end

  # update company ip
  def update_signin_ip
    if check_company?
      back_to_dashboard
      # current_user.company.update(:sign_in_ip => request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip)
      Message.change_password(@user, request).deliver_now
    end
  end

  # create user
  def send_create_user_mail
    Message.create_user(User.last).deliver_now
  end

end
