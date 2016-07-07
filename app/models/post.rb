class Post < ActiveRecord::Base
  validates :image, presence: true
  belongs_to :user
  has_attached_file :image,
                    :styles => {:medium => "300x300>"},
                    :file => {s3_permissions: :private,
                         s3_server_side_encryption: "AES256"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end