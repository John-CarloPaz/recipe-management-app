# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Recipe.destroy_all

puts "Creating recipes..."

recipes = [
  {
    title: "Classic Caesar Salad",
    category: "salad",
    cooking_time: 15,
    servings: 2,
    image_url: "https://images.pexels.com/photos/12557608/pexels-photo-12557608.jpeg",
    description: "A fresh and tangy Caesar salad with crunchy croutons and creamy dressing.",
    instructions: [
      "Toss romaine lettuce with Caesar dressing.",
      "Add croutons and parmesan.",
      "Serve chilled."
    ],
    ingredients: ["Romaine lettuce", "Caesar dressing", "Croutons", "Parmesan cheese"]
  },
  {
    title: "Tomato Basil Soup",
    category: "soup",
    cooking_time: 35,
    servings: 3,
    image_url: "https://images.pexels.com/photos/17302314/pexels-photo-17302314.jpeg",
    description: "A warm, comforting tomato soup with fresh basil and cream.",
    instructions: [
      "Sauté onions and garlic in olive oil.",
      "Add tomatoes and broth, then simmer for 20 minutes.",
      "Blend until smooth and stir in cream.",
      "Garnish with basil leaves."
    ],
    ingredients: ["Tomatoes", "Onion", "Garlic", "Vegetable broth", "Basil", "Cream"]
  },
  {
    title: "Spaghetti Carbonara",
    category: "main_course",
    cooking_time: 25,
    servings: 4,
    image_url: "https://images.pexels.com/photos/4518843/pexels-photo-4518843.jpeg",
    description: "A creamy Italian pasta dish made with eggs, cheese, pancetta, and pepper.",
    instructions: [
      "Cook spaghetti according to package instructions.",
      "Fry pancetta until crispy.",
      "Whisk eggs, parmesan, and black pepper together.",
      "Toss spaghetti with pancetta, then mix with egg mixture.",
      "Serve immediately."
    ],
    ingredients: ["Spaghetti", "Eggs", "Parmesan cheese", "Pancetta", "Black pepper"]
  },
  {
    title: "Garlic Butter Shrimp Bites",
    category: "appetizer",
    cooking_time: 20,
    servings: 4,
    image_url: "https://images.pexels.com/photos/725991/pexels-photo-725991.jpeg",
    description: "Mini skewers of shrimp coated in garlic butter, perfect for starters.",
    instructions: [
      "Melt butter and sauté garlic until fragrant.",
      "Add shrimp and cook until pink.",
      "Skewer shrimp on toothpicks.",
      "Serve with lemon wedges."
    ],
    ingredients: ["Shrimp", "Butter", "Garlic", "Lemon", "Parsley"]
  },
  {
    title: "Chocolate Chip Cookies",
    category: "dessert",
    cooking_time: 30,
    servings: 12,
    image_url: "https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg",
    description: "Soft and chewy cookies loaded with chocolate chips.",
    instructions: [
      "Preheat oven to 180°C (350°F).",
      "Cream butter and sugar together.",
      "Beat in eggs.",
      "Mix in flour, baking soda, and chocolate chips.",
      "Drop spoonfuls onto baking tray and bake until golden."
    ],
    ingredients: ["Flour", "Butter", "Sugar", "Eggs", "Chocolate chips", "Baking soda"]
  },
  {
    title: "Blueberry Pancakes",
    category: "breakfast",
    cooking_time: 25,
    servings: 3,
    image_url: "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg",
    description: "Fluffy pancakes loaded with fresh blueberries.",
    instructions: [
      "Mix flour, baking powder, milk, and eggs into a smooth batter.",
      "Fold in blueberries.",
      "Pour batter onto heated skillet and cook until bubbles form.",
      "Flip and cook until golden brown.",
      "Serve with maple syrup."
    ],
    ingredients: ["Flour", "Milk", "Eggs", "Blueberries", "Baking powder", "Maple syrup"]
  },
  {
    title: "Loaded Nachos",
    category: "snack",
    cooking_time: 15,
    servings: 4,
    image_url: "https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg",
    description: "Crispy tortilla chips topped with melted cheese, salsa, and jalapeños.",
    instructions: [
      "Preheat oven to 180°C (350°F).",
      "Layer tortilla chips on a baking tray.",
      "Top with cheese, beans, and jalapeños.",
      "Bake until cheese melts.",
      "Serve with sour cream and salsa."
    ],
    ingredients: ["Tortilla chips", "Cheddar cheese", "Black beans", "Jalapeños", "Salsa", "Sour cream"]
  },
  {
    title: "Mango Smoothie",
    category: "beverage",
    cooking_time: 10,
    servings: 2,
    image_url: "https://images.pexels.com/photos/775032/pexels-photo-775032.jpeg",
    description: "A refreshing tropical smoothie made with fresh mangoes and yogurt.",
    instructions: [
      "Peel and slice mangoes.",
      "Blend mango with yogurt, honey, and ice.",
      "Pour into glasses and garnish with mint leaves."
    ],
    ingredients: ["Mangoes", "Yogurt", "Honey", "Ice", "Mint leaves"]
  },
  {
    title: "Chicken Curry",
    category: "main_course",
    cooking_time: 40,
    servings: 4,
    image_url: "https://images.pexels.com/photos/2347311/pexels-photo-2347311.jpeg",
    description: "A flavorful chicken curry simmered in coconut milk and spices.",
    instructions: [
      "Sauté onions, garlic, and ginger.",
      "Add chicken pieces and brown slightly.",
      "Stir in curry powder and spices.",
      "Pour in coconut milk and simmer until chicken is tender."
    ],
    ingredients: ["Chicken", "Onion", "Garlic", "Ginger", "Coconut milk", "Curry powder"]
  },
  {
    title: "Bruschetta",
    category: "appetizer",
    cooking_time: 15,
    servings: 4,
    image_url: "https://images.pexels.com/photos/1438672/pexels-photo-1438672.jpeg",
    description: "Grilled bread rubbed with garlic and topped with fresh tomatoes and basil.",
    instructions: [
      "Toast bread slices until golden.",
      "Rub with garlic while warm.",
      "Top with chopped tomatoes, basil, and olive oil.",
      "Serve immediately."
    ],
    ingredients: ["Baguette", "Garlic", "Tomatoes", "Basil", "Olive oil"]
  }
]

recipes.each do |recipe_data|
  recipe = Recipe.create!(recipe_data)
  puts "Created recipe: #{recipe.title}"
end

puts "Seeded #{Recipe.count} recipes successfully!"