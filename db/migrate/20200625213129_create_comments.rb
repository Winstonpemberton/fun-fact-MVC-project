class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :fact_id
      t.integer :user_id
    end
  end
end
