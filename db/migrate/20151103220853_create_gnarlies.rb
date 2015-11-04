class CreateGnarlies < ActiveRecord::Migration
  def change
    create_table :gnarlies do |t|
      t.string :text
      t.string :image_uri
      t.integer :likes, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
