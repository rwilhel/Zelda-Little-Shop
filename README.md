### Zelda's Little Shop

An e-commerce site, serving the residents of Hyrule (Zelda reference) with all the best potions and equipment. 

![alt text](https://github.com/ACC25/Zelda-Little-Shop/blob/master/home_page_screenshot.jpeg "homepage")


Users have all the base functionality they would expect from an online merchandise shop:

+ Profile authentication and authorization
+ Browse inventory
+ Add items to cart
+ Adjust quantity of cart items
+ Checkout
+ View current and past orders

Admins have the added ability to:

+ Create new items
+ Edit items
+ Complete orders
+ View usage statistics

The live version of the site can be found at: https://fast-reaches-42091.herokuapp.com/

### More Pictures

![alt text](https://github.com/ACC25/Zelda-Little-Shop/blob/master/categories_screenshot.jpeg "categories")
![alt text](https://github.com/ACC25/Zelda-Little-Shop/blob/master/items_screenshot.jpeg "items")

### Install Locally

To run the application locally, fork and clone this repository: https://github.com/rwilhel/Zelda-Little-Shop.git

```
cd Zelda-Little-Shop
bundle install
rake db:setup
rake db:seed
rails server
```
Navigate to ```localhost:3000```

