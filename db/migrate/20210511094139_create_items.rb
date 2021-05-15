class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text   :details
      t.integer :category_id
      t.integer :status_id
      t.integer :cost_id
      t.integer :prefecture_id
      t.integer :delivery_day_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end

    

  end
end
