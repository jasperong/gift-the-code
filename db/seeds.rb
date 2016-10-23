# frozen_string_literal: true
require 'factory_girl_rails'
require 'faker'


30.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    location: "#{Faker::Address.city}, #{Faker::Address.state}",
    phone_number: Faker::PhoneNumber.cell_phone,
    occupation: Faker::Company.profession
  )
end

30.times do
  board = Thredded::Messageboard.create(
    name: Faker::Hipster.sentence(3, false, 2),
    description: Faker::Hacker.say_something_smart,
    closed: false,
  )
  board.save!

  rand(1..10).times do
    topic = board.topics.create(
      user_id: rand(1..(User.count)),
      title: Faker::Hipster.sentence(3, false, 2),
      sticky: Faker::Boolean.boolean(0.2),
      locked: Faker::Boolean.boolean(0.2)
    )
    topic.save!

    rand(1..12).times do
      post = topic.posts.create(
        user_id: rand(1..(User.count)),
        content: Faker::Hipster.paragraph(rand(1..3)),
        messageboard_id: topic.messageboard_id
      )
      post.save!
    end
  end
end
