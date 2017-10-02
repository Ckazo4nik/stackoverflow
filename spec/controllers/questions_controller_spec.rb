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
    before {  get :show, params: { id: question.id } }
    it "show questions" do
      expect(assigns(:question)).to eq question
    end
    it "render #show" do
      expect(response).to render_template :show
    end
  end
  describe "GET #new" do
    before { get :new }
    it 'new Question to question' do
      expect(assigns(:question)).to be_a_new(Question)
    end
    it "render #new" do
      expect(response).to render_template :new
    end
  end
  describe "GET #edit" do
    before {  get :edit, params: { id: question.id } }
    it "@question to question" do
      expect(assigns(:question)).to eq question
    end
    it "render #edit" do
      expect(response).to render_template :edit
    end
  end
end
