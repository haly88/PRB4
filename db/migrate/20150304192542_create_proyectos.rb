class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :nombre
      t.decimal :cuota_inicial, :precision => 12, :scale => 2
      t.decimal :cuota_mensual, :precision => 12, :scale => 2
      t.references :usuario, index: true

      t.timestamps null: false
    end
    add_foreign_key :proyectos, :usuarios
  end
end
