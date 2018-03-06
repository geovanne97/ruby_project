class BackofficeController < ApplicationController
  before_action :authenticate_admin!
  layout "backoffice"

  # we use this method to past the current_user like current_admin to pundit
  def pundit_user
    current_admin
  end
end
