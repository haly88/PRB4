class SorceryUserActivation < ActiveRecord::Migration
  def change
  	add_column :usuarios, :activation_state, :string, :default => nil
    add_column :usuarios, :activation_token, :string, :default => nil
    add_column :usuarios, :activation_token_expires_at, :datetime, :default => nil

    add_index :usuarios, :activation_token
  end
end
