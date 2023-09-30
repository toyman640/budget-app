class CreateCategoriesDealingsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :dealings do |t|
      t.index :category_id
      t.index :dealing_id
    end
  end
end
