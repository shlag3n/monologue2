class Monologue2AddIndexToTagName < ActiveRecord::Migration
  def change
    add_index :monologue2_tags, :name
  end
end
