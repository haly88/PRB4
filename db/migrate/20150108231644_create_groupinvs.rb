class CreateGroupinvs < ActiveRecord::Migration
  def change
    create_table :groupinvs do |t|
      t.string :nombre
      t.integer :personasMin
      t.integer :personasMax
      t.decimal :montoIngreso, :precision => 12, :scale => 2
      t.decimal :montoMensual, :precision => 12, :scale => 2
      t.boolean :esAdministrador

      t.timestamps null: false
    end
  end
end
