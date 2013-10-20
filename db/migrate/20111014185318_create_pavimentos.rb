class CreatePavimentos < ActiveRecord::Migration
  def change
    create_table :pavimentos do |t|
      t.string :empreendimento_id
      t.string :andar
      t.string :planta_pavimento
      t.string :pavimento_imagem_uid
      
      t.timestamps
    end
  end
end
