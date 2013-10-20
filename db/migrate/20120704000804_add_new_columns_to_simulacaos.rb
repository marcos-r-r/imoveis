class AddNewColumnsToSimulacaos < ActiveRecord::Migration
  def change
  	change_table :simulacaos do |t|
	  t.float :parcelas_12
      t.float :parcelas_24
      t.float :parcelas_50
    end
  end
end
