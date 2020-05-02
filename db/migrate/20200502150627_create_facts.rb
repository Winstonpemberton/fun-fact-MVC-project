class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :title
      t.string :description
    end
  end
end
