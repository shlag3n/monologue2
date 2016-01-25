class Monologue2MoveUserIdToPost < ActiveRecord::Migration
  class Monologue2::PostsRevision < ActiveRecord::Base
  end

  class Monologue2::Post < ActiveRecord::Base
    has_many :posts_revisions
  end

  def up
    add_column :monologue2_posts, :user_id, :integer
    Monologue2::Post.reset_column_information
    Monologue2::Post.all.each do |post|
      post.user_id = post.posts_revisions.first.user_id
      post.save(validate: false)
    end
    remove_column :monologue2_posts_revisions, :user_id
  end

  def down
    add_column :monologue2_posts_revisions, :user_id, :integer
    Monologue2::Post.reset_column_information
    Monologue2::Post.all.each do |post|
      post.posts_revisions.each do |revision|
        revision.user_id = post.user_id
        revision.save!
      end
    end
    remove_column :monologue2_posts, :user_id
  end
end
