class Question < ApplicationRecord
  validates :title, :body, presence: true
  has_many :answers
  has_many :attachments, as: :attachmentable
  has_many :comments, as: :commentable
  belongs_to :user

  accepts_nested_attributes_for :attachments





end
