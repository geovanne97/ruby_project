class AdminMailerPreview < ActionMailer::Preview
  def update_email
    AdminMailer.update_email(Admin.first, Admin.second)
  end

  def send_message
    AdminMailer.send_message(Admin.first.email, Admin.last.email, "subject text", "loren loren")
  end
end
