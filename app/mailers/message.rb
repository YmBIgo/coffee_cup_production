class Message < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message.send_url.subject
  #

  default from: "support@coffee-cup.info"

  def send_url(name)

    @name = name

    mail(
      to: @name,
      subject: "Coffee-Cupを使ってみよう！",
    ) do |format|
      format.html
    end

  end

  def pay_info(email, name)

    @email = email
    @name = name

    mail(
      to: @email,
      subject: "Coffee-Cup | 購入情報"
    ) do |format|
      format.text
    end

  end

end
