class Monologue2JoinPostsAndTags < ActiveRecord::Migration
  def change
     create_table :posts_tags_2, id:false do |t|
       t.integer :post_id,:tag_id
     end
   end
end
