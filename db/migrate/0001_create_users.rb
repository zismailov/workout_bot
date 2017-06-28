class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.integer :uid, null: false
      t.string :username
    end
  end
end
