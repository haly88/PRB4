class CreateGroupinvUsuarios < ActiveRecord::Migration
  def change
    create_table :groupinv_usuarios do |t|
      t.references :groupinv, index: true
      t.references :usuario, index: true
      t.boolean :administrador

      t.timestamps null: false
    end
    add_foreign_key :groupinv_usuarios, :groupinvs
    add_foreign_key :groupinv_usuarios, :usuarios
  end
end
