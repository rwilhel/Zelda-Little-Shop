class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :slug
      t.index  :slug, unique: true
      t.string :show
    end
  end
end
