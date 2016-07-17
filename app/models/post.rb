class Post < ActiveRecord::Base
  validates :image, presence: true                            
  belongs_to :user
  has_attached_file :image,                               #a post has an attached file (which i'm referring to as "image". the style lets me have a set size for each image)
                    :styles => {:medium => "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end