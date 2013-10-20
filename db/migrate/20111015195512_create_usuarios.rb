class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :empresa_id
      t.string :nome
      t.string :username
      t.string :crypted_password
      t.string :password_field
      t.string :tipo
      t.integer :permissao_id
      t.string :persistence_token

      t.timestamps
    end
  end
end
