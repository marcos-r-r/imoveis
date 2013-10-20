# encoding: utf-8

class Cliente < ActiveRecord::Base
 belongs_to :empresa
 has_many :historico_de_contatos

 before_destroy :check_historicos

 validates_presence_of :cpf_cnpj, :message => "Preencha o campo CPF/CNPJ"
 validates_uniqueness_of :cpf_cnpj, :scope => :empresa_id, :message => "Cliente já Cadastrado"
 validates_presence_of :nome, :message => "Preencha o campo nome"
 validates_presence_of :tipo, :message => "Escolha o Tipo de Cliente"

 def check_historicos
   if self.historico_de_contatos.any?
     errors.add(:base, "Esse cliente possui negociações e não pode ser apagado")

     false
   end
 end

end
