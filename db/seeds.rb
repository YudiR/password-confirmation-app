User.destroy_all
Article.destroy_all

users = [
  {email: "fro@do", password: "1234", password_confirmation: "1234"},
  {email: "c3p@0", password: "1234", password_confirmation: "1234"},
  {email: "her@mione", password: "1234", password_confirmation: "1234"},
  {email: "ton@y", password: "1234", password_confirmation: "1234"},
]

users.each do |user|
  User.create(user)
end

clubs = [
  {title: "The Green Dragon", content: "The place where the coolest vertically challenged citizens of Middle-Earth get loud and tell tall tales", user: User.last},
  {title: "Cantina at Mos Eisley", content: "If you want to prove you can hang with scum and villainy's greatest hits, this is your joint", user: User.last},
  {title: "The Hog's Head", content: "Aspiring wizards drink butterbeer here and host mind-numbing after parties", user: User.last},
  {title: "The Babylon Club", content: "Say hello to your little friend, or other friends at this south Florida staple", user: User.last}
]

clubs.each do |club|
  Article.create(club)
end

