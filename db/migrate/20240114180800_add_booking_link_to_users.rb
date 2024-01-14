class AddBookingLinkToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :booking_link, :string
    add_index :users, :booking_link, unique: true
  end
end
