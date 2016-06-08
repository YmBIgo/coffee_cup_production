class WelcomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to "/dashboard"
    else
      @mail_sender = MailSender.new
    end
  end

end
