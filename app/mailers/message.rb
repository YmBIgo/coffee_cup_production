class Message < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message.send_url.subject
  #

  default from: "support@coffee-cup.info"

  # Welcome index info mail

  def send_url(name)

    @name = name

    mail(
      to: @name,
      subject: "Coffee-Cupを使ってみよう！",
    ) do |format|
      format.html
    end

  end

  # How to purchase Coffee-Cup

end
