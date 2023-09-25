class CreateCategoriesDealingsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :dealings do |t|
      t.references :categories, null: false, foreign_key: true
      t.references :dealings, null: false, foreign_key: true
    end
  end
end
