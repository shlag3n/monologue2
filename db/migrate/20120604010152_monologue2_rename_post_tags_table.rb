class Monologue2RenamePostTagsTable < ActiveRecord::Migration
  def change
    rename_table :posts_tags_2, :monologue2_posts_tags
  end
end
