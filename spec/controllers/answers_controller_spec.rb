require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create(:question)}
  let(:answer) { create(:answer)}
  let(:user) { create(:user) }
  describe 'GET #index' do
    before do
      get :index
    end
    before do
      sign_in(user)
    end
    let(:answers) { create_list(:answer, 4) }
    it 'Вивід елементів' do
      expect(assigns(:answers)).to match_array(answers)
    end
    it 'Рендер #index' do
      expect(response).to render_template :index
    end
  end
  describe 'GET #new' do
  end
  describe 'GET #edit' do

  end
  describe 'POST #create' do
    before do
      sign_in(user)
    end
    context 'З валідними даними' do

      it 'Створення відповіді з валідними данними'  do
        expect { post :create, params: { answer: attributes_for(:answer) } }.to change(Answer, :count).by(1)
      end
      it 'Перенаправлення на #show' do
        post :create, params: { answer: attributes_for(:answer) }
        expect(response).to redirect_to answer_path(assigns(:answer))
      end
    end
  end
  describe 'PUTCH #update' do
    sign_in_user
    context "valid attributes" do
      it "assigns the request answer to @answer" do
        patch :update, params: { id: answer.id, answer: attributes_for(:answer) }
      end
      it "changes answer attributes" do
        patch :update, params: { id: answer.id , answer: { body: "newq"} }
        answer.reload
        expect(answer.body).to eq "newq"
      end
      it "redirect to the update answer" do
        patch :update, params: { id: answer.id, answer: attributes_for(:answer) }
        expect(response).to redirect_to answer
      end
    end
    context "invelid attributes" do
      before { patch :update, params: { id: answer.id , answer: {body: nil } }  }
      it "not update" do
        answer.reload
        expect(answer.body).to eq "MyText"
      end
      it "re-render edit" do
        expect(response).to render_template :edit
      end
    end

  end
  describe 'DELET #destroy' do

  end
end
