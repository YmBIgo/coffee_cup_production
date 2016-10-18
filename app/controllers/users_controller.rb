class UsersController < ApplicationController

  before_action :authenticate_user!
  before_filter :basic_auth, :if => :check_company?, :only => [:edit, :update]
  before_action :check_user_info, :only => [:pay_info, :pay_warning]

  def index
  end

  def edit

    current_ok_user!
    @user = User.find(params[:id])

    # company action
    update_signin_ip

  end

  def update

    current_ok_user!
    @user = User.find(params[:id])
    @user.update(update_params)
    redirect_to edit_user_path(current_user.id)
    flash[:notice] = "ユーザー情報を編集しました"

    # company action
    update_signin_ip

  end

  def pay_info
    @mail_sender = MailSender.new
  end

  def pay_warning
    @mail_sender = MailSender.new
  end

  private

  # user が登録されているかを確認する。
  def check_user_info
    unless current_user.family_name != "no data" && current_user.first_name != "no data" && current_user.sex != 0 && current_user.company_name != "no data" && current_user.phone_number != "no data"
      redirect_to edit_user_path(current_user.id)
      flash[:notice] = "まず必要項目を入力して下さい"
    end
  end

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

  # update company ip

  def update_signin_ip
    if check_company?
      current_user.company.update(:sign_in_ip => request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip)
      Message.change_password(@user, request).deliver_now
    end
  end

end
