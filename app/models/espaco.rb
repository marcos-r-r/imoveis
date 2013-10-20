# encoding: utf-8
class Espaco < ActiveRecord::Base
  
  image_accessor :planta
	belongs_to :empreendimento  
	belongs_to :pavimento
	has_one :historico_de_contato
	
	validates_presence_of :identificacao, :message => "Preencha o campo identificação"
	validates_presence_of :area_total, :message => "Preencha o campo Área total"


end
