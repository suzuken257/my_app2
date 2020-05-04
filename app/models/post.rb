class Post < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many  :comments

  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
