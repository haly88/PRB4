class CreateGroupinvProyectos < ActiveRecord::Migration
  def change
    create_table :groupinv_proyectos do |t|
      t.references :groupinv, index: true
      t.references :proyecto, index: true

      t.timestamps null: false
    end
    add_foreign_key :groupinv_proyectos, :groupinvs
    add_foreign_key :groupinv_proyectos, :proyectos
  end
end
