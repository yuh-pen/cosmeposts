class CreateCosmePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :cosme_pictures do |t|
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
