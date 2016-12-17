class WelcomeController < ApplicationController

  def index
    @mail_sender = MailSender.new
  end

end
