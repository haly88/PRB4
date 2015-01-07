class SorceryRememberMe < ActiveRecord::Migration
  def change
    add_column :usuarios, :remember_me_token, :string, :default => nil
    add_column :usuarios, :remember_me_token_expires_at, :datetime, :default => nil

    add_index :usuarios, :remember_me_token
  end
end