class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.text :text, null: false
      t.timestamps
      t.references :user, index: true, foreign_key: true
    end
  end
end
