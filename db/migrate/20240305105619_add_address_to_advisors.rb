class AddAddressToAdvisors < ActiveRecord::Migration[7.1]
  def change
    add_column :advisors, :address, :string
  end
end
