class Api::V1::QuestionsController < Api::V1::BaseController
  before_action :load_collection, only: :index
  before_action :load_question, only: [:show, :answers]
  before_action :load_answer, only: :answer

   def index
     respond_with @questions.to_json
   end
  def show
    respond_with @question
  end

   def answers
     @answers = @question.answers
     respond_with @answers
     end
   def answer
     respond_with @answer
   end
  private
   def load_collection
     @questions = Question.all
   end
  def load_question
    @question = Question.find(params[:id])
    end
  def load_answer
    @answer = Answer.find(params[:id])
   end
end