class UsersController < ApplicationController

  before_action :authenticate_user!

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

end
