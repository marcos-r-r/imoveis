class Pavimento < ActiveRecord::Base
  
  has_many :espacos, :dependent => :destroy
  image_accessor :pavimento_imagem
  belongs_to :empreendimento
  
end
