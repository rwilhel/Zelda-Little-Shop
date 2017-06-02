def create_categories
  categories = ["Potions",
                "Food",
                "Bags",
                "Bottle Items",
                "Equipment",
                "Instruments"]
  categories.each do |category|
    Category.create!(name: category)
    puts "Creating category: #{category}"
  end
end

def create_items_for_category_potions
  items = [
    ["Red Potion", "Heals the body", 4],
    ["Blue Potion", "Heals the body", 4],
    ["Green Potion", "Restores stamina", 4],
    ["Great Fairy's Tears", "Heals the body", 4],
    ["Heart", "Heals the body", 4],
    ["Yellow Potion", "Heals the body", 4],
    ["Piece of Heart", "Heals the body", 4]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Potions").id)
    puts "Creating item: #{item[0]} for Potions Category"
  end
end

def create_items_for_category_food
  items = [
    ["Spicy Pepper", "Pepper exploding with spice. Cook with it to help you withstand the cold", 5],
    ["Berries", "A fruit that grows on bushes. It has no special effects", 5],
    ["Mighty Carp", "A compound in its liver promotes muscle growth. When cooked in a dish it will increase your attack power", 10],
    ["Apple", "A common fruit found on trees all around Hyrule. Eat it fresh, or cook it to increase its effect", 5],
    ["Raw Meat", "Meat obtained from animals in plains and forests. You can eat it raw, but cooking it will make it more delicious and nutritious", 25]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Food").id)
    puts "Creating item: #{item[0]} for Foods Category"
  end
end

def create_items_for_category_bags
  items = [
    ["Big Bag", "Increases inventory space", 250],
    ["Bomb Bag", "Can carry up to 3 bombs", 100],
    ["Large Bomb Bag", "Can carry up to 8 bombs", 250],
    ["Quiver", "Carry up to 25 arrows for your bow", 100],
    ["Seed Satchel", "Carry up to 25 seeds for your slingshot", 50],
    ["Small Wallet", "Can hold up to 1000 rupees", 250],
    ["Medium Wallet", "Can hold up to 2500 rupees", 500],
    ["Large Wallet", "Can hold up to 5000 rupees", 750]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Bags").id)
    puts "Creating item: #{item[0]} for Bags Category"
  end
end

def create_items_for_category_bottle_items
  items = [
    ["Fish", "Restores 4 hearts", 15],
    ["Milk", "Restores 3 hearts", 10],
    ["Water", "Refreshing spring water", 10],
    ["Sacred Water", "Water from the sacred Deku Tree in the Korok Forest", 50],
    ["Fairy", "Restores all hearts. Revives you if you die with one in your inventory", 100]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Bottle Items").id)
    puts "Creating item: #{item[0]} for Bottle Items Category"
  end
end

def create_items_for_category_equipment
  items = [
    ["Wooden Sword", "A sword made of wood. Poor durability", 10],
    ["Soldier's Sword", "A sword once wielded by a solider. Average Durability", 20],
    ["Hylian Sword", "A sword blessed by the godess Hylia. High Durability", 50],
    ["The Master Sword", "Weapon of legend. The power to slay evil. Bane of Ganon", 1000],
    ["Wooden Shield", "A shield made of wood. Poor durability", 10],
    ["Mirror Shield", "A shield made of a reflective material. High durability", 100],
    ["Hero's Shield", "Shield made for a true hero. Extremely durable", 500]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Equipment").id)
    puts "Creating item: #{item[0]} for Equipment Category"
  end
end

def create_items_for_category_instruments
  items = [
    ["Flute", "instrument", 20],
    ["Ocarina of Time", "instrument", 1000],
    ["Sound Stone", "instrument", 10000]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Instruments").id)
    puts "Creating item: #{item[0]} for Instruments Category"
  end
end

def create_members
  members = [
    ["Link", "ilovezelda", "Wherever evil is"],
    ["Princess Zelda", "ilovelink", "Hyrule Castle"],
    ["Impa", "iamaninja", "Kakariko Village"],
    ["Sheik", "ilovelink", "Hyrule Castle"]]
  members.each do |member|
    User.create!(username: member[0],
                 password: member[1]
                 #address: patron[2]
                 )
    puts "Creating patron: #{member[0]}"
  end
end

def create_admins
  admins = [
    ["Daphnes Nohansen Hyrule", "ProudFather", "Hyrule Castle", 1],
    ["DNH", "ilovezelda", "Hyrule Castle", 1],
    ["Beedle", "ilovebeetles", "Everywhere he is needed", 1]]
  admins.each do |admin|
    User.create!(username: admin[0],
                 password: admin[1],
                #  address: admin[2],
                 role: admin[3])
    puts "Creating admin: #{admin[0]}"
  end
end

create_categories
create_items_for_category_potions
create_items_for_category_food
create_items_for_category_bags
create_items_for_category_bottle_items
create_items_for_category_equipment
create_items_for_category_instruments
create_admins
create_members
