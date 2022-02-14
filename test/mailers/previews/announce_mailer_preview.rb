# Preview all emails at http://localhost:3000/rails/mailers/announce_mailer
class AnnounceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/announce_mailer/Announcement_created
  def Announcement_created
    AnnounceMailer.Announcement_created
  end

end
