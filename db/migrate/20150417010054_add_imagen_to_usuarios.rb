class AddImagenToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :imagen, :string
  end
end
