class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :status, default: 'Ordered'
      t.timestamps null: false
    end
  end
end
