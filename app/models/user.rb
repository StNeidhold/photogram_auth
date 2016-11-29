class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#  Associations

#  Users have many photos, a photo belongs to a user
has_many( :photos, :class_name => "Photo", :foreign_key => "user_id")
#  Photos have many comments, a comment belongs to a photo
#  Users have many comments, a comment belongs to a user
has_many( :comments, :class_name => "Comment", :foreign_key => "user_id")
#  Users have many likes, a like belongs to a user
has_many( :likes, :class_name => "Like", :foreign_key => "user_id")
#  Photos have many likes, a like belongs to a photo
#  Users have many liked_photos through likes. Since this breaks naming conventions (the method name, .liked_photos, does not exactly match the class name, Photo), we'll have to write out the full form of the has_many/through:
has_many( :liked_photos, :through => "likes", :foreign_key => "user_id")
# Similarly, Photos have many fans through likes (source: user):

# Validations

# User
# username: presence, uniqueness
validates :username, :presence => true, :uniqueness => true
# Photo
# user_id: presence
# Like
# user_id: presence, uniqueness in combination with photo
# photo_id: presence
# Comment
# user_id: presence
# photo_id: presence
# body: presence

end
