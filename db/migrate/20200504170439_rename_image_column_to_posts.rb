class RenameImageColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :image, :video
  end
end
