class CreateAdvisors < ActiveRecord::Migration[7.1]
  def change
    create_table :advisors do |t|
      t.references :user, null: false, foreign_key: true
      t.text :bio
      t.text :speciality

      t.timestamps
    end
  end
end
