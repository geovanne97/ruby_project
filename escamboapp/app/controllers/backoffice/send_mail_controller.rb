class Backoffice::SendMailController < ApplicationController
  def edit
    #when i press the botton email he bring the id parameters i just have to take that
    @admin = Admin.find(params[:id])
    #this method is called in admin/index and just will find the views.js
    respond_to do |format|
      format.js
    end
  end

  def create
    #this begin will verify is have a error and throw a message, rescue will happen if have a error and will put a message to notify the user
    begin
    AdminMailer.send_message(current_admin,
                               params[:'recipient-text'],
                               params[:'subject-text'],
                               params['message-text']).deliver_now

    @notify_message = "email enviado com sucesso"
    @notify_flag = "success"
    rescue
    @notify_message = "email nao foi enviado,tente novamente! "
    @notify_flag = "error"
    end
    respond_to do |format|
      format.js
    end
  end
end
