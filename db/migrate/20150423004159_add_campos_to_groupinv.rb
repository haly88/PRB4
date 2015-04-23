class AddCamposToGroupinv < ActiveRecord::Migration
  def change
    add_column :groupinvs, :descripcion, :text
    add_reference :groupinvs, :tipos_inv, index: true
    add_foreign_key :groupinvs, :tipos_invs
    add_column :groupinvs, :imagen, :string
    remove_column :groupinvs, :es_administrador
  end
end
