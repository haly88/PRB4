class CreateTiposInvs < ActiveRecord::Migration
  def change
    create_table :tipos_invs do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
