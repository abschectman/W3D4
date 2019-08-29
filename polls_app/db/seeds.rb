# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Poll.destroy_all
Question.destroy_all
Answerchoice.destroy_all
Response.destroy_all

User.create!(username: 'Asher')
User.create!(username: 'Patrick')
Poll.create!(title: 'Shopping habits', author_id: User.last.id)
Poll.create!(title: 'Best programming language', author_id: User.first.id)
Question.create!(body: 'Trader Joe''s ?', poll_id: Poll.first.id)
Question.create!(body: 'Ruby or Sql?', poll_id: Poll.last.id)
Answerchoice.create!(text: 'yes', question_id: Question.first.id)
Answerchoice.create!(text: 'no', question_id: Question.first.id)
Answerchoice.create!(text: 'Ruby', question_id: Question.last.id)
Answerchoice.create!(text: 'Sql', question_id: Question.last.id)
Response.create!(user_id: User.last.id, answer_choice_id: Answerchoice.last.id)
Response.create!(user_id: User.first.id, answer_choice_id: Answerchoice.first.id)


