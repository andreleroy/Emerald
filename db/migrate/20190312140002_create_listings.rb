class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :location
      t.string :public_listing_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
