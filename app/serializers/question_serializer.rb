class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :attachments
  has_many :answers
end
