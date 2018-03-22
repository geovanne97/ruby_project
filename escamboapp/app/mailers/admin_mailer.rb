class AdminMailer < ApplicationMailer
#send a email to admin, and the current admin is who modify the admin information
def update_email(current_admin, admin)
  @current_admin = current_admin
  @admin = admin
  mail(to: @admin.email, subject: "Seus foram alterados com Sucesso!")
end

def send_message(current_admin, recipient, subject, message)
  @current_admin = current_admin
  @recipient = recipient
  @subject = subject
  @message = message
  mail(to: @recipient, subject: @subject)
end

end
