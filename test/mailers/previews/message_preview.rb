# Preview all emails at http://localhost:3000/rails/mailers/message
class MessagePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message/send_url
  def send_url
    Message.send_url
  end

end
