# Preview all emails at http://localhost:3000/rails/mailers/greeting_mailer
class GreetingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/greeting_mailer/send_notification
  def send_notification
    GreetingMailer.send_notification
  end

end
