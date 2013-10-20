class CreateVagaAssociadas < ActiveRecord::Migration
  def change
    create_table :vaga_associadas do |t|
      t.string :identificacao
      t.string :espaco_id
      t.string :id_unidade_negociada
      t.string :historico_de_contato_id

      t.timestamps
    end
  end
end
