class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastNameInitial
      t.string :username
      t.string :password_digest
      t.string :profilePic
      t.integer :age
      t.string :location

      t.timestamps
    end
  end
end
