class GreetingMailer < ApplicationMailer
default from: "Kohl <no-reply@example.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.greeting_mailer.send_notification.subject
  #
  def send_notification(recipe, user)
    @user = user
    @recipe = recipe
    mail to: user.email, subject: "A new recipe was added!"
  end
end
