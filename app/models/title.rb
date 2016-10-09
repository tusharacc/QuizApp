class Title < ActiveRecord::Base
	has_many :questions

	def self.get_all_title
		title_all = Title.all
	end

	def self.get_title_id title_name
		title_rel = Title.find_by title: title_name
	end

	def self.insert_title title_name
		title_rec = Title.create(title: title_name)
	end

	def self.update_questions id, my_hash

		title = Title.find id
		title.questions.create(question: my_hash["question"],option1: my_hash["options"][0],option2: my_hash["options"][1],option3: my_hash["options"][2],option4: my_hash["options"][3],answer: my_hash["answer"])

	rescue => e
		logger.debug "Error: Creating the data #{my_hash} #{e.full_messages}"
		return "Not Saved"
	end

end
