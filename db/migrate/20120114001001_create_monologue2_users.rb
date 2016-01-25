class CreateMonologue2Users < ActiveRecord::Migration
  def change
    create_table :monologue2_users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
