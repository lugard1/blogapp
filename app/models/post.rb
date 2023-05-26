class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :increase_post_counter

  def increase_post_counter
    author.increment!(:posts_counter)
  end

  def last_comments
    comments.order(created_at: :desc).limit(5)
  end
end
