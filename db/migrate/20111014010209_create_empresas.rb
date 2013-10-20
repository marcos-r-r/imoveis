class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :logomarca 
      t.string :empresa_logomarca_uid
      
      t.timestamps
    end
  end
end
