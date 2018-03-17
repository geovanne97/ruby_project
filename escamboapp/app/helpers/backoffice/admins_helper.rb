module Backoffice::AdminsHelper
  OptionsForRoles = Struct.new(:id, :description)

  def options_for_roles
#using map you can create automatically the array and save the struct
    Admin.roles_i18n.map do |key, value|
      OptionsForRoles.new(key, value)
    end
  end
end

#options = []
#this method he takes the 2 roles that admin have "full acess and restricted" and push this struct in options array
#Admin.roles_i18n.each do |key, value|
#  options.push(OptionsForRoles.new(key, value))
#end
#this option will return the array with the 2 tips of struct
#options
