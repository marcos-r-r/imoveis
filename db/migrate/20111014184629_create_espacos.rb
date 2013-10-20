class CreateEspacos < ActiveRecord::Migration
  def change
    create_table :espacos do |t|
      t.string :empreendimento_id
      t.string :pavimento_id
      t.string :tipo_de_espaco
      t.string :identificacao
      t.float :area_garagem
      t.integer :numero_garagem
      t.float :area_comum
      t.float :area_privativa
      t.float :area_total
      t.float :valor_m2
      t.float :valor_total
      t.string :pega_sol
      t.string :vaga_dupla
      t.string :localizacao
      t.string :planta_uid
      t.integer :status

      t.timestamps
    end
  end
end
