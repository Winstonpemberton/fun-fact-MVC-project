class AddColumnFacts < ActiveRecord::Migration
  def change
    add_column :facts, :image_url, :string
  end
end
