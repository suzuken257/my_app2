class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :text
      t.text :image
      t.timestamps
      t.references :user, index: true, foreign_key: true
    end
  end
end
