require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:question) { create(:question) }
  describe "GET #index" do
    let(:questions) { create_list(:question, 2) }
    before do
      get :index
    end
    it 'array of all questions' do
      expect(assigns(:questions)).to match_array(questions)
    end
    it 'render view #index' do
      expect(response).to render_template :index
    end
  end
  describe "GET #show" do
    sign_in_user
    before {  get :show, params: { id: question.id } }

    it "show questions" do
      expect(assigns(:question)).to eq question
    end
    it "render #show" do
      expect(response).to render_template :show
    end
    it 'build new attachments for answer' do
      expect(assigns(:answer).attachments.first).to be_a_new(Attachment)
    end
  end
  describe "GET #new" do
    sign_in_user
    before { get :new }
    it 'new Question to question' do
      expect(assigns(:question)).to be_a_new(Question)
    end
    it 'build new attachments for question' do
      expect(assigns(:question).attachments.first).to be_a_new(Attachment)
    end
    it "render #new" do
      expect(response).to render_template :new
    end
  end
  describe "GET #edit" do
    sign_in_user
    before {  get :edit, params: { id: question.id } }
    it "@question to question" do
      expect(assigns(:question)).to eq question
    end
    it "render #edit" do
      expect(response).to render_template :edit
    end
  end
  describe "POST #create" do
    sign_in_user
    context "with valid" do
      it "save new question!" do
        expect { post :create, params: { question: attributes_for(:question) } }.to change(Question, :count).by(1)
      end
      it "redirect to show view" do
        post :create, params: { question: attributes_for(:question) }
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end
    context "with not valid" do
      it "not save!" do
        expect { post :create, params: { question: attributes_for(:invalid_question) } }.to_not change(Question, :count)
      end
      it "re-render new" do
        post :create, params: { question: attributes_for(:invalid_question) }
        expect(response).to render_template :new
      end
    end
  end
  describe "PATCH #update" do
    sign_in_user
    context "valid attributes" do
      it "assigns the request question to @question" do
        patch :update, params: { id: question.id, question: attributes_for(:question) }
        #expect(assigns(:question)).to eq question
      end
      it "changes question attributes" do
        patch :update, params: { id: question.id , question: {title: "newd", body: "newq"} }
        question.reload
        expect(question.title).to eq "newd"
        expect(question.body).to eq "newq"
      end
      it "redirect to the update question" do
        patch :update, params: { id: question.id, question: attributes_for(:question) }
        expect(response).to redirect_to question
      end
    end
    context "invelid attributes" do
      before { patch :update, params: { id: question.id , question: {title: nil, body: "newq"} }  }
      it "not update" do
        question.reload
        expect(question.title).to eq "MyString"
        expect(question.body).to eq "MyText"
      end
      it "re-render edit" do
        expect(response).to render_template :edit
      end
    end

  end
  describe "DELETE #destroy" do
    sign_in_user
    it "delete question" do
      question
      expect{ delete :destroy, params: { id: question.id } }.to change(Question, :count).by(-1)
    end
    it "redirect to index view" do
      delete :destroy, params: { id: question.id }
      expect(response).to redirect_to questions_path
    end
  end

end
