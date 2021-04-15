class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question has been created"
      redirect_to questions_path
    else
      flash[:danger] = "Question has not been created!"
      redirect_to new_question_path # TO IMPROVE: Better to render than redirect but had trouble with RSpec tests using render
    end

  end
  
  private

  def question_params
    params.require(:question).permit(:title, :body)
  end


end
