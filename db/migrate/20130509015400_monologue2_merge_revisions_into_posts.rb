class Monologue2MergeRevisionsIntoPosts < ActiveRecord::Migration
  class Monologue2::PostsRevision < ActiveRecord::Base
  end

  class Monologue2::Post < ActiveRecord::Base
  end

  def up
    Monologue2::Post.reset_column_information
    add_column :monologue2_posts, :title, :string
    add_column :monologue2_posts, :content, :text
    add_column :monologue2_posts, :url, :string
    add_column :monologue2_posts, :published_at, :datetime
    remove_column :monologue2_posts, :posts_revision_id
    add_index :monologue2_posts, :url, unique: true

    Monologue2::Post.reset_column_information

    Monologue2::Post.all.each do |post|
      latest_revision =  latest_revision_for(post)
      post.title =latest_revision.title
      post.content =latest_revision.content
      post.url =latest_revision.url
      post.published_at =latest_revision.published_at
      post.save(validate: false)
    end

    drop_table :monologue2_posts_revisions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

  private
  def latest_revision_for(post)
    Monologue2::PostsRevision.where("post_id = ?", post.id).order("monologue_posts_revisions.updated_at DESC").limit(1).first
  end
end
