class CreateSimulacaos < ActiveRecord::Migration
  def change
    create_table :simulacaos do |t|
      t.float :valor_total
      t.float :entrada
      t.float :valor_entrada
      t.float :saldo
      t.float :cub
			t.float :parcelas_30
			t.float :parcelas_36
			t.float :parcelas_48
			t.float :parcelas_48_juros
			t.float :parcelas_60
			t.float :parcelas_60_juros
			t.string :historico_de_contato_id

      t.timestamps
    end
  end
end
