class Monologue2AddIndexToPostsRevisionUrl < ActiveRecord::Migration
  def change
    add_index :monologue2_posts_revisions, :url
  end
end
