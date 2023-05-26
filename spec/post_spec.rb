require 'rails_helper'

RSpec.describe Post, type: :model do
  post = Post.new(author_id: 1, title: 'first post', text: 'this is the first post', comments_counter: 3,
                  likes_counter: 2)

  it 'checks the post author id' do
    expect(post.author_id).to eql 1
  end

  it 'checks title presence for post' do
    post.title = ''
    expect(post).to_not be_valid
    expect(post.title).to eql ''
  end

  it 'checks title length' do
    post.title = 'agu' * 100
    expect(post).to_not be_valid
    expect(post.title.length).to eql 300
  end

  it 'checks text input' do
    expect(post.text).to_not eql ''
    expect(post.text).to eql 'this is the first post'
  end

  it 'has a valid number for comment counter' do
    post.comments_counter = -3
    expect(post).to_not be_valid
  end

  it 'has a valid number for comment counter' do
    post.comments_counter = 5
    expect(post.comments_counter).to eql 5
  end

  it 'has a valid number for likes counter' do
    post.likes_counter = -5
    expect(post).to_not be_valid
  end

  it 'checks increase_post_counter' do
    user = User.create!(name: 'Lugard', posts_counter: 0)

    post = user.posts.create!(title: 'Post title', text: 'Some post', comments_counter: 3, likes_counter: 2)

    post.increase_post_counter
    post.increase_post_counter
    post.increase_post_counter

    user.reload

    expect(user.posts_counter).to eq(4)
  end

  it 'brings last five comments for the post' do
    user = User.create!(name: 'Lugard', photo: 'www.unsplash.com', bio: 'Lorem ipsum', posts_counter: 5)

    post = user.posts.create!(title: 'first post', text: 'this is the first post', comments_counter: 3,
                              likes_counter: 2)

    comment1 = post.comments.create!(author_id: user.id, text: 'first comment')
    comment2 = post.comments.create!(author_id: user.id, text: 'second comment')
    comment3 = post.comments.create!(author_id: user.id, text: 'third comment')
    comment4 = post.comments.create!(author_id: user.id, text: 'fourth comment')
    comment5 = post.comments.create!(author_id: user.id, text: 'fifth comment')

    expect(post.last_comments).to eq([comment5, comment4, comment3, comment2, comment1])
  end
end
