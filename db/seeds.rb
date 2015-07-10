require 'faker'


admin = User.new(
  name:   'Admin User',
  email:  'admin@example.com',
  password: 'helloworld',
  admin: true
  )

admin.skip_confirmation!
admin.save

10.times do
user = User.new(
  name:     Faker::Name.name,
  email:    Faker::Internet.email,
  password: Faker::Internet.password

  )
  user.skip_confirmation!
  user.save!
end

users = User.all

50.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs
    )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"