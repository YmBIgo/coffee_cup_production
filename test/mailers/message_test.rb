require 'test_helper'

class MessageTest < ActionMailer::TestCase
  test "send_url" do
    mail = Message.send_url
    assert_equal "Send url", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
