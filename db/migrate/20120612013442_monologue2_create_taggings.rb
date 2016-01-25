class Monologue2CreateTaggings < ActiveRecord::Migration
  def change
    create_table :monologue2_taggings do |t|
      t.integer :post_id, :tag_id
    end

    add_index :monologue2_taggings, :post_id
    add_index :monologue2_taggings, :tag_id

  end
end
