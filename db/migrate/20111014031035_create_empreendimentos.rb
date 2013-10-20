class CreateEmpreendimentos < ActiveRecord::Migration
  def change
    create_table :empreendimentos do |t|
      t.string :empresa_id
      t.string :codigo
      t.string :nome_do_empreendimento
      t.float  :cub
      t.integer :dias_val_neg
      t.boolean :ativo

      t.timestamps
    end
  end
end
