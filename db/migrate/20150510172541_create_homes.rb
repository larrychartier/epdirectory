class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :name
      t.string :address1
      t.string :city
      t.string :postalCode
      t.string :province
      t.string :country
      t.string :description

      t.timestamps null: false
    end
  end
end
