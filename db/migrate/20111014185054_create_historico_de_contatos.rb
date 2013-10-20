class CreateHistoricoDeContatos < ActiveRecord::Migration
  def change
    create_table :historico_de_contatos do |t|
      t.date :data
      t.string :cliente_id
      t.string :espaco_id
      t.string :usuario_id
      t.string :empresa_id
      t.string :empreendimento_id
      t.string :negociacao
      t.string :status
      t.string :avaliacao
      t.integer :simulacao_id

      t.timestamps
    end
  end
end
