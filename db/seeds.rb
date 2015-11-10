require 'faker'
50.times do
  user = User.create(email:Faker::Internet.email, password:"password",name:Faker::Name.name, avatar_url:Faker::Avatar.image)
  (1+rand(20)).times do
    deck=Question.create(question:Faker::Name.title,answer:Faker::Lorem.paragraph, user_id:user.id)
    end
end

