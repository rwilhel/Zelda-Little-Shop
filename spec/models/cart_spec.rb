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

    purse = {"1" => 2, "2" => 3}
    cart = Cart.new(purse)
    cart.add_item("1")
    cart.increase_quantity("2")
    cart.decrease_quantity("1")
    cart.add_item("3")
    expect(cart.total).to eq(70)
    expect(cart.quantity_for("1")).to eq(2)
    expect(cart.quantity_for("2")).to eq(4)
  end

end
