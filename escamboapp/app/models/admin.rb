class Admin < ActiveRecord::Base
  enum role: [:full_access, :restricted_access]
#this escop pass the admin with full access

scope :with_full_access, -> { where(role: 'full_access')}

#or you can do the same escope using this method
#def self.with_full_access
#  where(role: 'full_access')
#end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role_br
    if self.role == 'full_access'
      'Acesso completo'
    else
      'Acesso restrito'
    end
  end
end
