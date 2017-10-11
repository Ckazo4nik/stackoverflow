class Attachment < ApplicationRecord
  belongs_to :attachmentable, optional: true
  mount_uploader :file, FileUploader

end
