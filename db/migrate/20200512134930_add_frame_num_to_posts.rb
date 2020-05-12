class AddFrameNumToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :starta, :integer
    add_column :posts, :startb, :integer
    add_column :posts, :enda, :integer
    add_column :posts, :endb, :integer
  end
end
