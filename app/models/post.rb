class Post < ActiveRecord::Base
  validates :image, presence: true
  belongs_to :user
  has_attached_file :file, s3_permissions: :private,
                         s3_headers: { "x-amz-server-side-encryption" => "AES256" },
                    :image,
                    :styles => {:medium => "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end