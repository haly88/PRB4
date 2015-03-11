class CreateProyectoUsuarios < ActiveRecord::Migration
  def change
    create_table :proyecto_usuarios do |t|
      t.references :proyecto, index: true
      t.references :usuario, index: true

      t.timestamps null: false
    end
    add_foreign_key :proyecto_usuarios, :proyectos
    add_foreign_key :proyecto_usuarios, :usuarios
  end
end
