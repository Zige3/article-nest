Comment.destroy_all
PostTag.destroy_all
Tag.destroy_all
Post.destroy_all
Profile.destroy_all
User.destroy_all

user1 = User.create!(
  username: "alice",
  email: "alice@example.com",
  password: "password"
)
user1.create_profile!(
  display_name: "Alice",
  bio: "I love writing about Rails and web development."
)

user2 = User.create!(
  username: "bob",
  email: "bob@example.com",
  password: "password"
)
user2.create_profile!(
  display_name: "Bob",
  bio: "Tech enthusiast and blogger."
)

tag1 = Tag.create!(name: "rails")
tag2 = Tag.create!(name: "ruby")
tag3 = Tag.create!(name: "web")

post1 = user1.posts.create!(
  title: "Getting Started with Rails",
  body: "Rails makes it easier to build web applications quickly and cleanly."
)

post2 = user2.posts.create!(
  title: "Why Ruby is Fun",
  body: "Ruby is elegant, readable, and enjoyable to use for many developers."
)

post1.tags << [tag1, tag2, tag3]
post2.tags << [tag2]

post1.comments.create!(
  user: user2,
  content: "Great introduction!"
)

post2.comments.create!(
  user: user1,
  content: "Nice post about Ruby!"
)

puts "Seed data created successfully!"