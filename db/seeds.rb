require 'faker'
# 50.times do
#   user = User.create(email:Faker::Internet.email, password:"password",name:Faker::Name.name, avatar_url:Faker::Avatar.image)
# end

# 5.times do
#   # comment = Comment.create(comment: Faker::Lorem.paragraph,user_id: 1+rand(User.count), question_id:1+rand(Question.count))
#   comment = Comment.create(comment: Faker::Lorem.paragraph,user_id: 1+rand(User.count), question_id: 555)
#     rand(20).times do
#       reply = Reply.create(reply: Faker::Lorem.sentence, comment_id: comment.id, user_id: 1+rand(User.count))
#     end
# end

# 10.times do
#   q = Question.create(user_id: 1+rand(User.count), dummy_answer1: Faker::Lorem.sentence, dummy_answer2: Faker::Lorem.sentence, real_answer: Faker::Lorem.sentence, accepted: true, category_id: 1+rand(Category.count), citation: Faker::Lorem.sentence, dummy_answer3: Faker::Lorem.sentence)
#   rand(50).times do
#     comment = Comment.create(comment: Faker::Lorem.paragraph,user_id: 1+rand(User.count))
#     rand(20).times do
#       reply = Reply.create(reply: Faker::Lorem.sentence, comment_id: comment.id, user_id: 1+rand(User.count))
#     end
#     q.comments << comment
#   end
# end


# 100.times do
#   q = Question.create(user_id: 1+rand(User.count), dummy_answer1: Faker::Lorem.sentence, dummy_answer2: Faker::Lorem.sentence, real_answer: Faker::Lorem.sentence, accepted: false, category_id: 1+rand(Category.count), citation: Faker::Lorem.sentence, dummy_answer3: Faker::Lorem.sentence)
# end

Question.all.each do |q|
  # q.update_attributes(question: Faker::Lorem.sentence)
  if q.accepted == false
    q.update_attributes(status: 'pending')
  end
end
