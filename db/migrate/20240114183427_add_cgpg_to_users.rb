class AddCgpgToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :cgp, :boolean
  end
end
