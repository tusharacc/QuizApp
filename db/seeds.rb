# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
question_title = ["History","Geography","Politics","Science"]
n = 1
answer_array = ["A","B","C","D"]
number_of_time = [6,8,3,9]
question_title.each do |header|
	@title = Title.create(title: header)
	7.times do |k|
		@title.questions.create(question: "Question" + n.to_s,option1: "A",option2: "B",option3: "C",option4: "D",answer: answer_array.sample)
		n += 1
	end
end

=end

Authenticate.create(username: "Tushar")
Authenticate.create(username: "Saurabh")
