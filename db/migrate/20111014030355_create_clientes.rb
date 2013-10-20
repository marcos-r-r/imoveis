class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :empresa_id
      t.string :usuario_id
      t.string :tipo
      t.string :nome
      t.string :cpf_cnpj
      t.string :endereco
      t.string :ddd
      t.string :telefone
      t.string :nome_contato

      t.timestamps
    end
  end
end
