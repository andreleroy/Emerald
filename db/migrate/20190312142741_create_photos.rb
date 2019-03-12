class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :listing, foreign_key: true
      t.string :story

      t.timestamps
    end
  end
end
