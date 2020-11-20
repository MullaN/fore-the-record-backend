class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true
      t.belongs_to :match, null: false, foreign_key: true
      t.integer :hole_1
      t.integer :hole_2
      t.integer :hole_3
      t.integer :hole_4
      t.integer :hole_5
      t.integer :hole_6
      t.integer :hole_7
      t.integer :hole_8
      t.integer :hole_9
      t.integer :hole_10
      t.integer :hole_11
      t.integer :hole_12
      t.integer :hole_13
      t.integer :hole_14
      t.integer :hole_15
      t.integer :hole_16
      t.integer :hole_17
      t.integer :hole_18

      t.timestamps
    end
  end
end
