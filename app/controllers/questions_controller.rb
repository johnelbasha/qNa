class QuestionsController < ApplicationController
  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question has been created"
      redirect_to questions_path
    end

  end
  
  private

  def question_params
    params.require(:question).permit(:title, :body)
  end


end
