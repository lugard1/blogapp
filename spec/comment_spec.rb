require 'rails_helper'

describe Comment, type: :model do
  comment = Comment.new(author_id: 1, post_id: 1, text: 'first comment')

  it 'has a author id number' do
    expect(comment.author_id).to_not eql(-3)
    expect(comment.author_id).to eql 1
  end

  it 'has a post id number' do
    expect(comment.post_id).to_not eql(-5)
    expect(comment.post_id).to eql 1
  end

  it 'has a text for comment' do
    comment.text = ''
    expect(comment.text).to_not eql 'first comment'
  end

  it 'check post comments_counter is increasing' do
    User.new(name: 'Lugard', photo: 'www.unsplash.com', bio: 'Lorem ipsum', posts_counter: 5)

    post = Post.new(author_id: 1, title: 'first post', text: 'this is the first post', comments_counter: 3,
                    likes_counter: 2)

    comment = Comment.new(author_id: 1, post:, text: 'texting')

    post.comments_counter = 0
    post.save

    comment.increase_comment_counter
    comment.increase_comment_counter

    expect(post.comments_counter).to eq(2)
  end
end
