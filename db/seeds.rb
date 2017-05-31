# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def create_categories
  categories = ["Potions", "Food", "Bags", "Bottle Items", "Equipment", "Instruments"]
  categories.each do |category|
    Category.create!(name: category)
    puts "Creating category: #{category}"
  end
end

def create_items_for_category_potions
  items = [["Red Potion", "Heals the body", 4], ["Blue Potion", "Heals the body", 4], ["Great Fairy's Tears", "Heals the body", 4], ["Heart", "Heals the body", 4], ["Yellow Potion", "Heals the body", 4], ["Piece of Heart", "Heals the body", 4]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Potions").id)
    puts "Creating item: #{item[0]} for Potions Category"
  end
end

def create_items_for_category_food
  items = [["Milk", "Feeds the body", 2], ["Berries", "Feeds the body", 2], ["Pie", "Feeds the body", 2]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Food").id)
    puts "Creating item: #{item[0]} for Foods Category"
  end
end

def create_items_for_category_bags
  items = [["Big Bag", "Put stuff here", 6], ["Bomb Bag", "Put stuff here", 6], ["Quiver", "Put stuff here", 6], ["Seed Satchel", "Put stuff here", 6], ["Wallet", "Put stuff here", 6], ["Big Bag", "Put stuff here", 6]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Bags").id)
    puts "Creating item: #{item[0]} for Bags Category"
  end
end

def create_items_for_category_bottle_items
  items = [["Fish", "Put stuff here", 10], ["Sacred Water", "Put stuff here", 10], ["Fairy", "Put stuff here", 10]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Bottle Items").id)
    puts "Creating item: #{item[0]} for Bottle Items Category"
  end
end

def create_items_for_category_equipment
  items = [["Wooden Sword", "weapon", 20], ["Hero's Sword", "weapon", 50], ["Hylian Sword", "Weapon", 40], ["Wooden Shield", "defensive item", 20], ["Hero's Shield", "defensive item", 70]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Equipment").id)
    puts "Creating item: #{item[0]} for Equipment Category"
  end
end

def create_items_for_category_instruments
  items = [["Flute", "instrument", 20], ["Ocarina of Time", "instrument", 1000], ["Sound Stone", "instrument", 10000]]
  items.each do |item|
    Item.create!(name: item[0],
                  description: item[1],
                  price: item[2],
                  category_id: Category.find_by(name: "Instruments").id)
    puts "Creating item: #{item[0]} for Instruments Category"
  end
end

create_categories
create_items_for_category_potions
create_items_for_category_food
create_items_for_category_bags
create_items_for_category_bottle_items
create_items_for_category_equipment
create_items_for_category_instruments
