require 'test_helper'

class AnnounceMailerTest < ActionMailer::TestCase
  test "Announcement_created" do
    mail = AnnounceMailer.Announcement_created
    assert_equal "Announcement created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
