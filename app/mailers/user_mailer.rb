class UserMailer < ActionMailer::Base
  default from: "louisangelini@gmail.com"

  def sendLogs()
    attachments["Room_Temp_Logs.xls"] = File.read("C:\\Users\\angell\\Desktop\\Room_Temp_Logs.xls")
    mail(:to => 'louisangelini@gmail.com', :subject => "hello")
  end
end
