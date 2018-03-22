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
    AdminMailer.send_message(current_admin,
                               params[:'recipient-text'],
                               params[:'subject-text'],
                               params['message-text']).deliver_now
    respond_to do |format|
      format.js
    end
  end
end
