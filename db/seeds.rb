def create_categories
  categories = ["Potions",
                "Munitions",
                "Equipment",
                "Storage",
                "Special Items",
                "Key Items"]
  categories.each do |category|
    Category.create!(name: category)
    puts "Creating category: #{category}"
  end
end

def create_items_for_category_potions
  id = Category.find_by(name: "Potions").id,
  Item.create(name: "Red Potion",
              description: "Heals the body. Restores 10 Hearts.",
              price: 10,
              category_id: id,
              avatar: File.new("app/assets/images/icon-potions-0.png"),
              show: "http://i.imgur.com/i4xKpco.png"])

  Item.create(name: "Blue Potion",
              description: "Heals the body. Restores 5 Hearts.",
              price: 15,
              avatar: File.new("app/assets/images/icon-potions-1.png"),
              show: "http://i.imgur.com/5jMJLJq.png"])

  Item.create(name: "Yellow Potion",
              description: "Increases Defense for a short time.",
              price: 15,
              avatar: File.new("app/assets/images/icon-potions-2.png"),
              show: "http://i.imgur.com/2uipJ5U.png"])

  Item.create(name: "Fairy",
              description: "Restores all hearts. Revives you if you die with one in your inventory.",
              price: 100,
              category_id: id,
              avatar: File.new("app/assets/images/icon-potions-3.png"),
              show: "http://i.imgur.com/zAPUGJA.png"])

  Item.create(name: "Great Fairy's Tears",
              description: "Heals the body and increases the number Hearts for a short time.",
              price: 50,
              category_id: id,
              avatar: File.new("app/assets/images/icon-potions-4.png"),
              show: "http://i.imgur.com/LQwvzH5.png"])

  Item.create(name: "Piece of Heart",
              description: "Increases Heart container if you collect 4.",
              price: 250,
              category_id: id,
              avatar: File.new("app/assets/images/icon-potions-5.png"),
              show: "http://i.imgur.com/lB4F0dJ.png"])

  Item.create(name: "Heart Container",
              description: "Increases Heart count by 1.",
              price: 500,
              category_id: id,
              avatar: File.new("app/assets/images/icon-potions-6.png"),
              show: "http://i.imgur.com/XTQuW39.png"])

  puts "Created items for Potions Category"
end

def create_items_for_category_special_items
  id = Category.find_by(name: "Special Items").id,
  Item.create(name: "Midnas Helmet",
              description: "The physical manifestation of extremely powerful Shadow magic created by an 'ancient race'.",
              price: 750,
              category_id: id,
              avatar: File.new("app/assets/images/icon-special-0.png"),
              show: "http://i.imgur.com/QQYWKD0.jpg"])
  Item.create(name: "Phantom Armor",
              description: "Near-impenetrable armor that cannot be overcome by traditional weapons.",
              price: 1000,
              category_id: id,
              avatar: File.new("app/assets/images/icon-special-1.png"),
              show: "http://i.imgur.com/gIJZPLV.jpg"])
  Item.create(name: "Hylian Shield",
              description: "A metal heater shield of the same type once wielded by Hylian Knights.",
              price: 500,
              category_id: id,
              avatar: File.new("app/assets/images/icon-special-2.png"),
              show: "http://i.imgur.com/y5JBHj9.png"])
  Item.create(name: "Master Sword",
              description: "A weapon of legend. Known at the Blade of Evil's Bane, The Sword of Time and the Sword of Resurrection. Imbued with the power to vanquish evil. Only weapon powerful enough to destroy Ganon.",
              price: 5000,
              category_id: id,
              avatar: File.new("app/assets/images/icon-special-3.png"),
              show: "http://i.imgur.com/JqotxlO.png"])

  puts "Created items for Special Items Category"
end

def create_items_for_category_storage
  id = Category.find_by(name: "Storage").id,
  Item.create(name: "Bomb Bag",
              description: "Can carry up to 10 bombs.",
              price: 100,
              category_id: id,
              avatar: File.new("app/assets/images/icon-storage-0.png"),
              show: "http://i.imgur.com/Ba86z7J.png"])
  Item.create(name: "Small Wallet",
              description: "Can hold up to 1000 rupees.",
              price: 250,
              category_id: id,
              avatar: File.new("app/assets/images/icon-storage-1.png"),
              show: "http://i.imgur.com/xa6dAui.png"])
  Item.create(name: "Medium Wallet",
              description: "Can hold up to 2500 rupees.",
              price: 500,
              category_id: id,
              avatar: File.new("app/assets/images/icon-storage-2.png"),
              show: "http://i.imgur.com/hISZmBi.png"])
  Item.create(name: "Large Wallet",
              description: "Can hold up to 5000 rupees.",
              price: 750,
              category_id: id,
              avatar: File.new("app/assets/images/icon-storage-3.png"),
              show: "http://i.imgur.com/9VEXzuW.png"])
  Item.create(name: "Small Quiver",
              description: "Carry up to 10 arrows for your bow.",
              price: 100,
              category_id: id,
              avatar: File.new("app/assets/images/icon-storage-4.png"),
              show: "http://i.imgur.com/nmXeQ1p.png"])
  Item.create(name: "Medium Quiver",
              description: "Carry up to 15 arrows for your bow.",
              price: 150,
              category_id: id,
              avatar: File.new("app/assets/images/icon-storage-5.png"),
              show: "http://i.imgur.com/Qji3E6x.png"])
  Item.create(name: "Large Quiver",
              description: "Carry up to 25 arrows for your bow.",
              price: 250,
              category_id: id,
              avatar: File.new("app/assets/images/icon-storage-6.png"),
              show: "http://i.imgur.com/fqsLspc.png"])
  Item.create(name: "Light Quiver",
              description: "Carry up to 10 Light arrows for your bow.",
              price: 200,
              category_id: id,
              avatar: File.new("app/assets/images/icon-storage-7.png"),
              show: "http://i.imgur.com/vnZbMwS.png"])

  puts "Created items for Storage Category"
end

def create_items_for_category_munitions
  id = Category.find_by(name: "Munitions").id,
  Item.create(name: "Bombs",
              description: "A pack of 5 Bombs", 15,
              avatar: File.new("app/assets/images/icon-munitions-0.png"),
              show: "http://i.imgur.com/hESM7dY.png"])

  Item.create(name: "Water Bombs",
              description: "A pack of 5 Water Bombs.",
              price: 25,
              avatar: File.new("app/assets/images/icon-munitions-1.png"),
              show: "http://i.imgur.com/hf3x8Ph.png"])

  Item.create(name: "Arrow",
              description: "A single wooden arrow. The projectile of choice for a bow.",
              price: 5,
              avatar: File.new("app/assets/images/icon-munitions-2.png"),
              show: "http://i.imgur.com/e4l6Rwe.png"])

  Item.create(name: "Bundle of Arrows",
              description: "A bundle of 10 Arrows. The projectile of choice for a bow.",
              price: 30,
              category_id: id,
              avatar: File.new("app/assets/images/icon-munitions-3.png"),
              show: "http://i.imgur.com/DELq7o6.png"])

  Item.create(name: "Fire Arrow",
              description: "A single Fire Arrow. Imbued with fire, these have the power to damage enemies and immolate certain objects.",
              price: 75,
              avatar: File.new("app/assets/images/icon-munitions-4.png"),
              show: "http://i.imgur.com/MtyPwUI.png"])
  Item.create(name: "Light Arrows",
              description: "A set of 3 Light Arrows. Enchanted with the power of light. Can vanquish evil.",
              price: 250,
              category_id: id,
              avatar: File.new("app/assets/images/icon-munitions-5.png"),
              show: "http://i.imgur.com/FxayaZ0.png"])

  puts "Created items for General Goods Category"
end

def create_items_for_category_equipment
  id = Category.find_by(name: "Equipment").id,
  Item.create(name: "Boomerang",
              description: "Used to stun enemies, retrieve items,
              and trigger switches. Some weak enemies can be killed with it.",
              price: 100,
              category_id: id,
              avatar: File.new("app/assets/images/icon-equipment-0.png"),
              show: "http://i.imgur.com/yQ0PPnd.png"])
  Item.create(name: "Hook Shot",
              description: "A spring loaded chain with a spearhead tip. Used to pull yourself towards an object.",
              price: 150,
              category_id: id,
              avatar: File.new("app/assets/images/icon-equipment-1.png"),
              show: "http://i.imgur.com/pOkREWw.png"])
  Item.create(name: "Bow",
              description: "A basic necessity. The go to when it comes to ranged combat. Fires arrows.",
              price: 150,
              category_id: id,
              avatar: File.new("app/assets/images/icon-equipment-2.png"),
              show: "http://i.imgur.com/H1XkyjW.png"])
  Item.create(name: "White Sword",
              description: "A sword of light can had the power to repel darkness. Upgraded with the blessings of the great spirits.",
              price: 250,
              category_id: id,
              avatar: File.new("app/assets/images/icon-equipment-3.png"),
              show: "http://i.imgur.com/0prH4IF.png"])
  Item.create(name: "Mirror Shield",
              description: "A shield made of a reflective material. The shield's polished surface can reflect light or energy.",
              price: 250,
              category_id: id,
              avatar: File.new("app/assets/images/icon-equipment-4.png"),
              show: "http://i.imgur.com/JuFu77l.png"])

  puts "Created items for Equipment Category"
end

def create_items_for_category_key_items
  id = Category.find_by(name: "Key Items").id,
  Item.create(name: "Compass",
              description: "This device allows you to see the locations of Treasure Chests and dungeon boss rooms along with your current position on the map.",
              price: 250,
              category_id: id,
              avatar: File.new("app/assets/images/icon-key-0.png"),
              show: "http://i.imgur.com/nib1zaE.png"])
  Item.create(name: "Lens of Truth",
              description: "A magical lens crafted by the Sheikah that can see through any illusion,
              such as h)dden doors, pits and other things.",
              price: 200,
              category_id: id,
              avatar: File.new("app/assets/images/icon-key-1.png"),
              show: "http://i.imgur.com/oTtyu4D.png"])
  Item.create(name: "Boss Key",
              description: "A key that opens the final boss champer of a dungeon. User these to skip future dungeons.",
              price: 500,
              category_id: id,
              avatar: File.new("app/assets/images/icon-key-2.png"),
              show: "http://i.imgur.com/1QjdyPv.png"])
  Item.create(name: "Ocarina of Time",
              description: "A treasured heirloom of the Royal Family. Full of endless mysterious powers.",
              price: 1000,
              category_id: id,
              avatar: File.new("app/assets/images/icon-key-3.png"),
              show: "http://i.imgur.com/i1cprhn.png"])
  Item.create(name: "Triforce",
              description: "A scared relic. The sacred golden triangles were left behind by the three Golden Goddesses. Contain the power to grant any wish.",
              price: 10000,
              category_id: id,
              avatar: File.new("app/assets/images/icon-key-4.png"),
              show: "http://i.imgur.com/PdPZJIL.png"])

  puts "Created items for Key Items Category"
end

def create_members
  members = [
    ["Link", "ilovezelda", "Wherever evil is"],
    ["Impa", "iamaninja", "Kakariko Village"],
    ["Sheik", "ilovelink", "Hyrule Castle"]]
  members.each do |member|
    User.create!(username: member[0],
                 password: member[1],
                 location: member[2])
    puts "Creating patron: #{member[0]}"
  end
end

def create_admins
  admins = [
    ["Daphnes Nohansen Hyrule", "ProudFather", "Hyrule Castle", 1],
    ["Princess Zelda", "ilovelink", "Hyrule Castle"],
    ["Beedle", "ilovebeetles", "Everywhere he is needed", 1]]
  admins.each do |admin|
    User.create!(username: admin[0],
                 password: admin[1],
                 location: admin[2],
                 role: admin[3])
    puts "Creating admin: #{admin[0]}"
  end
end

create_categories
create_items_for_category_potions
create_items_for_category_special_items
create_items_for_category_storage
create_items_for_category_munitions
create_items_for_category_equipment
create_items_for_category_key_items
create_admins
create_members
