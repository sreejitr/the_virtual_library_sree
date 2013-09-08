class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode
      t.string :useremail
      t.string :password
      t.string :aboutme
      t.string :interests

      t.timestamps
    end
  end
end
