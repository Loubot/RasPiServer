class SendLogs < ActionMailer::Base
  default from: "louisangelini@gmail.com"

  def sendLogs()
    mail(:to => "lllouis@yahoo.com", :subject => "Registered")
  end
end
