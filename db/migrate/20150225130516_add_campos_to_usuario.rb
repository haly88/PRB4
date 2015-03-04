class AddCamposToUsuario < ActiveRecord::Migration
  def change
  	add_column :usuarios, :nombre, :string
  	add_column :usuarios, :apellido, :string
  	add_column :usuarios, :es_empresa, :boolean
  	add_column :usuarios, :razon_social, :string
  end
end
