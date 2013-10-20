class Empresa < ActiveRecord::Base
	
	has_many :empreendimentos, :dependent => :destroy 
	has_many :usuarios, :dependent => :destroy
	has_many :clientes, :dependent => :nullify
     
  image_accessor :empresa_logomarca

end
