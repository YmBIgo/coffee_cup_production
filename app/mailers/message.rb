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

  # Create User
  def create_user(user)

    @email = "support@coffee-cup.info"
    @user = user

    mail(
      to: @email,
      subject: "ユーザー登録がありました"
    ) do |format|
      format.text
    end

  end

  # Change Password
  def change_password(user, request)

    @email = "support@coffee-cup.info"
    @user = user

    @request = request
    @url     = @request.url
    @host_ip = @request.env["HTTP_X_FORWARDED_FOR"] || @request.remote_ip
    @user_agent = @request.env["HTTP_USER_AGENT"]

    mail(
      to: @email,
      subject: "パスワードが変更されました"
    ) do |format|
      format.text
    end

  end

end
