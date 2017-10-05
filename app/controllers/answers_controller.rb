class AnswersController < ApplicationController
  before_action :answer_params, only: [ :show, :edit ]
  before_action :authenticate_user!
  before_action :set_question, only: [:new, :create]
  def index
    @answers = Answer.all
  end

  def show
    
  end

  def edit
    
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.build(set_params)
    if @answer.save
      redirect_to  @question, notice: "Ваша відповідь була створена"
    else
      render :new
    end
  end

  def update
    
  end

  def destroy

  end

  private
  def set_question
    @question = Question.find(params[:question_id])
  end
  def answer_params
    @answer = Answer.find(params[:id])
  end
  def set_params
    params.require(:answer).permit(:body, :question_id)
  end
end
