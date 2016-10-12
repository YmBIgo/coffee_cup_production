class UsersController < ApplicationController

  before_action :authenticate_user!
  before_filter :basic_auth, :if => :check_company?, :only => [:edit, :update, :destroy]

  def index
  end

  def edit
    current_ok_user!
    @user = User.find(params[:id])
  end

  def update
    current_ok_user!
    @user = User.find(params[:id])
    @user.update(update_params)
    redirect_to edit_user_path(current_user.id)
    flash[:notice] = "ユーザー情報を編集しました"
  end

  def pay_info
  end

  def pay_warning
    @mail_sender = MailSender.new
  end

  private

  def current_ok_user!
    user = User.find(params[:id])
    if current_user == user
      return true
    else
      redirect_to dashboard_path
      flash[:alert] = "閲覧権限はありません"
    end
  end

  def update_params
    params.require(:user).permit(:first_name, :family_name, :company_name, :phone_number, :sex, :prefecture)
  end

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

end
