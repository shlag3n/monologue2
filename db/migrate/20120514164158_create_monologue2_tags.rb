class CreateMonologue2Tags < ActiveRecord::Migration
  def change
    create_table :monologue2_tags do |t|
      t.string :name

    end
  end
end
