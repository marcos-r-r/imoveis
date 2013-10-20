class Usuario < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validates_length_of_password_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
    c.validates_length_of_password_confirmation_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
    c.logged_in_timeout = 20.minutes # default is 10.minutes
  end
	belongs_to :empresa
	has_many :historico_de_contatos
	
	 validates_presence_of :nome, :tipo
	
	def has_no_credentials?
    self.crypted_password.blank? && self.openid_identifier.blank?
  end
end
