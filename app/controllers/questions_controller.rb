class QuestionsController < ApplicationController
  require 'json'
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
end
