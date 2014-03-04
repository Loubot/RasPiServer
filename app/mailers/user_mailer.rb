class UserMailer < ActionMailer::Base
  default from: "louisangelini@gmail.com"

  def sendLogs()
    attachments["Room_Temp_Logs.xls"] = File.read("/home/louis/Desktop/Room_Temp_Logs.xls")
    mail(:to => 'lynch1976michael@gmail.com', :subject => "hello")
  end
end
