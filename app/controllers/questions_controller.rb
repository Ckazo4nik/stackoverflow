class QuestionsController < ApplicationController
  #before_action :question_params, only: [ :show, :destroy, :update, :edit]
  def index
   @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end
  private
  def question_params
    @question = Question.find(params[:id])
  end
  def question_params
    #params.require(:question).permit(:title, :body)
  end
end
