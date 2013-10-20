class HistoricoDeContato < ActiveRecord::Base

	has_one :simulacao
	belongs_to :cliente
	belongs_to :empreendimento
  belongs_to :empresa
  belongs_to :usuario
	belongs_to :espaco
	accepts_nested_attributes_for :simulacao
	
	validates_presence_of :cliente, :message => "^Escolha o Cliente"
	
end
