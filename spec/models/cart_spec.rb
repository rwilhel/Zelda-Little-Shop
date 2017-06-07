require 'rails_helper'

RSpec.describe Cart, type: :model do

  it "can add/remove contents" do
    category = Category.create!(name: "Potions")

    item = Item.create!(name: "Red Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    item2 = Item.create!(name: "Blue Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)
    item3 = Item.create!(name: "Yellow Potion",
                  description: "feels guuuuud",
                  price: 10,
                  category_id: category.id)

    purse = {"#{item.id}" => 2, "#{item2.id}" => 3}
    cart = Cart.new(purse)
    cart.add_item("#{item.id}")
    cart.increase_quantity("#{item2.id}")
    cart.decrease_quantity("#{item.id}")
    cart.add_item("#{item3.id}")
    expect(cart.total).to eq(70)
    expect(cart.quantity_for("#{item.id}")).to eq(2)
    expect(cart.quantity_for("#{item.id}")).to eq(2)
  end
  
end
