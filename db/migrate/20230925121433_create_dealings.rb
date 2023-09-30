class CreateDealings < ActiveRecord::Migration[7.0]
  def change
    create_table :dealings do |t|
      t.references :author,null: false, index:true, foreign_key: { to_table: :users }
      t.string :name
      t.decimal :amount
      t.timestamps
    end
  end
end
