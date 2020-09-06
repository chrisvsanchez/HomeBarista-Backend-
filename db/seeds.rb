# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
Review.destroy_all
Feed.destroy_all
AddPostToFeed.destroy_all

puts "Creating users"
10.times do 
    User.create(
    bio:"Faker::Quote.famous_last_words",
    email:Faker::Internet.email,
    password:"123",
    current_coffee_beans:"#{Faker::Coffee.blend_name}blend from #{Faker::Coffee.origin}",
    coffee_medium:"Espresso",
    profile_img:Faker::Avatar.image,
)
end
puts "Users Complete!"
puts "Creating Posts"
10.times do 
    Post.create(
    title:Faker::Lorem.sentence,
    article_text:Faker::Lorem.paragraph,
    image:"https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    user_id: User.all.sample.id,
    ) 
end
puts "Posts Created"
puts "Creating Reviews"
20.times do 
    Review.create(
    text:Faker::Lorem.sentence,
    post_id: Post.all.sample.id,
    user_id: User.all.sample.id,
    )
end
puts "Reviews Complete"
puts"Creating Feed"
10.times do 
    Feed.create(
    user_id: User.all.sample.id
    )
end
puts"Feed Complete"
puts"Creating AddPostToFeed"
10.times do 
    AddPostToFeed.create(
    post_id: Post.all.sample.id,
    feed_id: Feed.all.sample.id
    )
end
puts"AddPostToFeed complete"