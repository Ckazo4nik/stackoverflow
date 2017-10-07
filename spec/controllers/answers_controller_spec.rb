require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
 describe 'POST #creare' do
   let(:question) { create(:question) }
   sign_in_user
   context "with valid" do
     it "save new answer!" do
       expect { post :create, params: { answer: attributes_for(:answer), question_id: question } }.to change(question.answers, :count).by(1)
     end
     it "redirect to show view" do
       post :create, params: { answer: attributes_for(:answer), question_id: question  }
       expect(response).to redirect_to question_path(question)
     end
   end
   context "with not valid" do
     it "not save!" do
       expect { post :create, params: { answer: attributes_for(:invalid_answer), question_id: question  } }.to_not change(Answer, :count)
     end
     it "re-render create" do
       post :create, params: { answer: attributes_for(:invalid_answer),question_id: question  }
       expect(response).to redirect_to question_path(question)
     end
   end
 end
end
