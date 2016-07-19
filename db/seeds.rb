User.create!(name: "Just Example",
           email: "just@example.com",
           password:"1234567",
           password_confirmation: "1234567",
           admin: true,
           activated: true,
           activated_at: Time.zone.now)
9.times do |n|
  name = Faker::Name.name
  email = "just-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password:password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

20.times do
  category =Faker::Book.genre
  title=Faker::Book.title
  author=Faker::Book.author
  isbn=Faker::Code.isbn
  available=Faker::Number.between(1, 500)
  Book.create!(category: category, 
               title: title, 
               author: author, 
               isbn: isbn, 
               available: available)
end

