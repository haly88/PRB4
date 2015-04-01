class AddProyectoToGroupinvUsuarios < ActiveRecord::Migration
  def change
    add_reference :groupinv_usuarios, :proyecto, index: true
    add_foreign_key :groupinv_usuarios, :proyectos
  end
end
