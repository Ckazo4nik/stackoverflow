class QuestionsController < ApplicationController
  before_action :question_params, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :index ]
  before_action :build_answer, only: :show
  authorize_resource
  respond_to :js
  def index
   @question = Question.new
   respond_with(@questions = Question.all)
  end

  def show
  respond_with @question
  end

  def new
  respond_with(@question = Question.new)
  end

  def edit
  end

  def create
    @questions = Question.all
    respond_with(@question = current_user.questions.create(set_params))
  end
  def update
    @question.update(set_params)
    respond_with @question
  end

  def destroy
    respond_with(@question.destroy)
  end

  private

  def build_answer
    @answer = @question.answers.build
    end
  def question_params
    @question = Question.find(params[:id])
  end
  def set_params
    params.require(:question).permit(:title, :body, :user_id, attachments_attributes: [:file])
  end
end
