require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'validates attributes' do
    expect(Question.new(body: "123")).to_not be_valid
  end

end
