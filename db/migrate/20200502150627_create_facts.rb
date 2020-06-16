class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :title
      t.string :description
      t.integer :category_id
      t.integer :user_id
    end
  end
end
