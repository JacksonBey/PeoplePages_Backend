# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: "yak", password: "sample", age: 26, firstName: 'Jackson', lastNameInitial: 'B', location: 'My Home')

p1 = Post.create(content: 'this is post!', user_id: u1.id, username: 'Jackson B.')
p2= Post.create(content: 'another post. Yuh.', user_id: u1.id, username: 'Jackson B.')

l1= Like.create(user_id: u1.id, post_id: p1.id)

