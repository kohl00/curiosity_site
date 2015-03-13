ActionMailer::Base.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => "edwin.kohlbrenner@gmail.com",
    :password  => Rails.application.secrets.mandrill_api_key, # SMTP password is any valid API key
    :authentication => 'login', # Mandrill supports 'plain' or 'login'
  }

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.default charset: "utf-8"
