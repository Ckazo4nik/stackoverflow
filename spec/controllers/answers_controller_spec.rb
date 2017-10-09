require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let!(:question) { create(:question) }
  sign_in_user
 describe 'POST #creare' do
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
 describe 'PUTCH #update' do
   let(:answer) { create(:answer, question: question)}
   it "assigns the request question to @question" do
     patch :update,  params: { answer: attributes_for(:answer),id: answer, question_id: question }, format: :js
     expect(assigns(:answer)).to eq answer
   end
   it "changes answer attributes" do
     patch :update,  params: { answer: { body: 'lalala'},id: answer, question_id: question }, format: :js
     answer.reload
     expect(answer.body).to eq "lalala"
   end
   it "render update question" do
     patch :update,  params: { answer: attributes_for(:answer),id: answer, question_id: question }, format: :js
     expect(response).to render_template :update
   end
 end

end
