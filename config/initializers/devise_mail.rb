ActionMailer::Base.smtp_settings = {
 :address              => "SMTP SERVER ADDRESS",
 :port                 => 80,
 :domain               => ENV["DOMAIN"],
 :authentication       => :plain,
 :user_name            => ENV["USERNAME"],
 :password             => ENV["PASSWORD"]

}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
