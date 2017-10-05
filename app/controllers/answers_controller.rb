class AnswersController < ApplicationController
  before_action :answer_params, only: [ :show, :edit, :update, :destroy ]
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
    @answer = @question.answers.create(set_params.merge(user_id: current_user.id))
    if @answer.save
      redirect_to  @question, notice: "Ваша відповідь була створена"
    else
      render :new
    end
  end

  def update
    
  end

  def destroy
    @answer.destroy
    redirect_back fallback_location: @question
  end

  private
  def set_question
    @question = Question.find(params[:question_id])
  end
  def answer_params
    @answer = Answer.find(params[:id])
  end
  def set_params
    params.require(:answer).permit(:body, :question_id, :user_id)
  end
end
