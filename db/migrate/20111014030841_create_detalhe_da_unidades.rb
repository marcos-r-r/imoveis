class CreateDetalheDaUnidades < ActiveRecord::Migration
  def change
    create_table :detalhe_da_unidades do |t|
      t.string :espaco_id
      t.integer :vagas_id

      t.timestamps
    end
  end
end
