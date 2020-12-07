class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.bigint :steam_id
      t.string :avatar

      t.timestamps
    end
  end
end
