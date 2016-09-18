class Question < ActiveRecord::Base
	belongs_to :title

	def self.get_saved_answer(question_id)
    	result = Question.find_by id: question_id
    	result['answer']
	end
end
