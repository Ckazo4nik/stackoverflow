class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_answer, only: :update
  respond_to :js, only: :create
  def create
    @question = Question.find(params[:question_id])
    respond_with(@answer = @question.answers.create(set_params.merge(user_id: current_user.id)))
  end

  def update
    @answer.update(set_params.merge(user_id: current_user.id))
    respond_with @answer

  end
  private

  def load_answer
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end
  def set_params
    params.require(:answer).permit(:body, :question_id, :user_id, attachments_attributes: [:file])
  end
end
