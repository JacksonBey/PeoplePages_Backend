# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: "yak", password: "sample", age: 26, firstName: 'Jackson', lastNameInitial: 'B', location: 'My Home')
u2 = User.create(username: "jak", password: "123", age: 26, firstName: 'Billy', lastNameInitial: 'W', location: 'unknown')
u3 = User.create(username: "pac", password: "pac", age: 89, firstName: 'Packy', lastNameInitial: 'P', location: 'last seen in Texas')

p1 = Post.create(content: 'this is post!', user_id: u1.id, username: 'Jackson B.')
p2= Post.create(content: 'another post. Yuh.', user_id: u1.id, username: 'Jackson B.')
p3= Post.create(content: 'masterwork post', user_id: u2.id, username: 'Billy W.')
p4= Post.create(content: 'does this thing work?', user_id: u3.id, username: 'Packy P.')

c1= Comment.create(content: 'insightful.', username:'Billy W.',  user_id: u2.id, post_id: p1.id)
l5= Like.create(user_id: u1.id, comment_id: c1.id)
c2= Comment.create(content: 'I really like this!', username:'Billy W.', user_id: u2.id, post_id: p1.id)
c3= Comment.create(content: 'I M M E N S E', username:'Jackson B.', user_id: u1.id, post_id: p3.id)

l1= Like.create(user_id: u1.id, post_id: p1.id)
n1 = Notification.create(user_id: u1.id, reason: 'You liked your Post!', post_id: p1.id)
l2= Like.create(user_id: u1.id, post_id: p2.id)
n2 = Notification.create(user_id: u1.id, reason: 'You liked your Post!', post_id: p2.id)
l3= Like.create(user_id: u2.id, post_id: p2.id)
n3 = Notification.create(user_id: u1.id, reason: 'Billy liked your Post!', post_id: p1.id)
n4 = Notification.create(user_id: u1.id, reason: 'Billy liked your Post!', post_id: p1.id)
n5 = Notification.create(user_id: u1.id, reason: 'Billy liked your Post!', post_id: p1.id)
n6 = Notification.create(user_id: u1.id, reason: 'Billy liked your Post!', post_id: p1.id)