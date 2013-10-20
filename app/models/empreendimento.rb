class Empreendimento < ActiveRecord::Base
 has_many :pavimentos, :dependent => :destroy
 belongs_to :empresa
 has_many :historico_de_contatos
end
