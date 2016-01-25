class Monologue2DeleteJoinPostsTags < ActiveRecord::Migration
  def up
    drop_table :monologue2_posts_tags
  end

  def down
    create_table :monologue2_posts_tags, id:false do |t|
      t.integer :post_id,:tag_id
    end
  end
end
