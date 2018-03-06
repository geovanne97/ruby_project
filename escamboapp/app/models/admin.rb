class Admin < ActiveRecord::Base
#Constants
ROLES = {:full_access => 0, :restricted_access => 1}

#Enums
  enum role: ROLES

#Scopes
#this escop pass the admin with full access
scope :with_full_access, -> { where(role: ROLES[:full_access])}
scope :with_restricted_access, -> { where(role: ROLES[:restricted_access])}

#or you can do the same function in the scope using this method
#def self.with_full_access
#  where(role: 'full_access')
#end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#  def role_br
#    if self.role == 'full_access'
#      'Acesso completo'
#    else
#      'Acesso restrito'
#    end
#  end
end
