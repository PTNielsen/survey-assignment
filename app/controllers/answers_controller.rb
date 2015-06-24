class AnswersController < ApplicationController

  def new
    @answers = Answer.new
    @questions = Question.find params[:question_id]
  end

  def create
    @questions = Question.find params[:question_id]
    answers_params = params[:answer]
    @answers = Answer.new(
      question_id: answers_params[:question_id],
      description: answers_params[:description]
    )
    if @answers.save
      # redirect_to i
      redirect_to question_path(@questions), notice: "Your answer has been submitted!"
    else
      # redisplay form with errors
      render :new
    end
  end

end