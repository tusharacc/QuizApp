class QuestionsController < ApplicationController
  require 'json'
  skip_before_filter :verify_authenticity_token
  def show_question
  	@question_type = params[:question_type]
  	logger.debug "The incoming title is #{@question_type}"
  	title = Title.find_by title: @question_type
  	@question = title.questions
  	logger.debug "The list of is #{@question.count}"
  	respond_to do |format|
      format.js
      format.html
    end
  end

  def check_answers
      answers = params[:answers]
      logger.debug "the incoming data is #{answers}"
      #text_hash = JSON.parse(answers)
      @response =[]
      answers.each_value do |value|
        correct_answer = Question.get_saved_answer(value['question_id'])
        my_hash = {'question_id':  value['question_id'], 'user_answer': value['user_answer']}
        if value['user_answer'] != correct_answer
          my_hash['response'] = 'Incorrect'
          my_hash['correct_asnwer'] = correct_answer
        else
          my_hash['response'] = 'Correct'
          my_hash['correct_asnwer'] = correct_answer
        end
        @response.push(my_hash)
      end
      logger.debug "the total length of outgoing data is #{@response}"
      respond_to do |format|
        format.js 
        format.html
      end
  end

  def show_upload_screen

  end

  def upload_questions
      
    @errored_questions = 0
    @updated_questions = 0
    tempfl = params[:file]
   
    question_array = JSON.parse(tempfl.tempfile.read)

    question_array.each do |question_hash|
      logger.debug "the hash i am trying is #{question_hash}"
      id_rel = Title.get_title_id(question_hash["title"])
      if id_rel.nil? 
        id = Title.insert_title(question_hash["title"])
      else
        id = id_rel.id
      end
      question_updated = Title.update_questions(id, question_hash)
      logger.debug "the return is #{question_updated}"
      if question_updated == "Not Saved"
        @errored_questions += 1
      else
        @updated_questions += 1
      end
    end
    logger.debug "the data value is #{@errored_questions} #{@updated_questions}"
    respond_to do |format|
      if request.xhr?
        format.js {}
      else 
        format.html
      end
    end
  end
end
