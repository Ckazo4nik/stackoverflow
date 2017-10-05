require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  let(:answer) { create(:answer)}
  let(:user) { create(:user) }
  describe 'GET #index' do
    before do
      get :index
    end
    let(:answers) { create_list(:answer, 2) }
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

  end
  describe 'DELET #destroy' do

  end
end
