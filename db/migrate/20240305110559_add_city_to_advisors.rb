class AddCityToAdvisors < ActiveRecord::Migration[7.1]
  def change
    add_column :advisors, :city, :string
  end
end
