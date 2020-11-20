class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :screenshot_url
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
