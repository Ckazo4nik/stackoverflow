class Answer < ApplicationRecord
  validates :body, presence: true
  belongs_to :question
  belongs_to :user

  has_many :attachments, as: :attachmentable
  has_many :comments, as: :commentable

  accepts_nested_attributes_for :attachments
end
