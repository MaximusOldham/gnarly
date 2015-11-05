class CreateGnarlies < ActiveRecord::Migration
  def change
    create_table :gnarlies do |t|
      t.string :image_uri
      t.string :text
      t.references :user, index: true, foreign_key: true
      t.integer :likes

      t.timestamps null: false
    end
  end
end
