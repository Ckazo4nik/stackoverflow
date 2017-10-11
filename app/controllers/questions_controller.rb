class QuestionsController < ApplicationController
  before_action :question_params, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :index ]
  def index
   @questions = Question.all
  end

  def show
    @answer = @question.answers.build
  end

  def new
    @question = Question.new
    @question.attachments.build
  end

  def edit
  end

  def create
    @question = current_user.questions.create(set_params)
    if @question.save
      redirect_to @question , notice: 'Question was created.'
    else
      render :new
    end
  end

  def update
    @question.update(set_params)
    if @question.save
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path

  end
  private
  def question_params
    @question = Question.find(params[:id])
  end
  def set_params
    params.require(:question).permit(:title, :body, :user_id, attachments_attributes: [:file])
  end
end
