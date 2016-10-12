class MailSendersController < ApplicationController

  def create

    if user_signed_in?
      @email_type = params[:mail_sender][:mail_type].to_i

      # email_type で Message を分岐
      case @email_type
      # 1 の場合は、購入情報
      when 1 then
        Message.pay_info(current_user.email, current_user.full_name).deliver_now
        MailSender.create(create_params.merge(:email => current_user.email))
        redirect_root_and_notice
      end

    else
      @email = params[:mail_sender][:email]
      Message.send_url(@email).deliver_now
      MailSender.create(create_params)
      redirect_root_and_notice
    end

  end

  private

  def create_params
    params.require(:mail_sender).permit(:email, :mail_type)
  end

  def redirect_root_and_notice
    redirect_to root_path
    flash[:notice] = "メールが送信されました！"
  end

end
