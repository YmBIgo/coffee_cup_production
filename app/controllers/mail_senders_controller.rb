class MailSendersController < ApplicationController

  def create
    @email = params[:mail_sender][:email]
    Message.send_url(@email).deliver_now
    MailSender.create(create_params)
    redirect_to root_path
    flash[:notice] = "メールが送信されました！"
  end

  private

  def create_params
    params.require(:mail_sender).permit(:email)
  end

end
