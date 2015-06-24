class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find params[:id]
    @answers = Answer.select { |a| a[:question_id] == @questions.id }
  end

  def new
    @questions = Question.new
  end

  def create
    questions_params = params[:question]
    @questions = Question.new(
      title: questions_params[:title],
      description: questions_params[:description]
    )
    if @questions.save
      # redirect_to i
      redirect_to question_path(@questions), notice: "Your question has been asked!"
    else
      # redisplay form with errors
      render :new
    end
  end
  
end