# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

def seed_category
  categories = ['Apparel', 'Sports & Outdoors', 'Children', 'Books, Movies & Music', 'Electronics', 'Miscellaneous']

  categories.each do |category|
  	Category.create(name: category)
  end
end


def new_item(user)
  Item.create!(name: Faker::Lorem.word,
           description: Faker::Lorem.sentence,
           size: ['Large', 'Medium', 'Small'].sample,
           color:['Red', 'Orange', "Yellow", "Blue"].sample,
           category: Category.all.sample,
           price: rand(1..100),
           user: user,
           image: File.new(Rails.root +
            'public/system/items/images/000/000/016/medium/bigpreview_Red_canoe.jpg'))
end

def seed_items

  10.times do
    User.all.each do |user|
      new_item(user)
    end
  end

end

seed_items
