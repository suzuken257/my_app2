class Post < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many  :comments, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories, dependent: :destroy

  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
