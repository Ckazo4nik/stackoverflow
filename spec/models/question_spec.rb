require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { create(:question)}
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should have_many :answers }
  it { should have_many :attachments }
  it { should belong_to :user }
  it { should accept_nested_attributes_for :attachments }

  it 'репутація після створення' do
    expect(Reputation).to receive(:calculate).with(question)
    question.save!
  end
end
