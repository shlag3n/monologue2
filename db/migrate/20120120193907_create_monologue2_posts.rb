class CreateMonologue2Posts < ActiveRecord::Migration
  def change
    create_table :monologue2_posts do |t|
      t.integer :posts_revision_id
      t.boolean :published

      t.timestamps
    end
  end
end
