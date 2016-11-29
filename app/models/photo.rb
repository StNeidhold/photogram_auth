class Photo < ActiveRecord::Base

#  Associations

#  Users have many photos, a photo belongs to a user
# belongs_to( :user, :class_name => "User", :foreign_key => "user_id")
belongs_to :user

#  Photos have many comments, a comment belongs to a photo
has_many( :comments, :class_name => "Comment", :foreign_key => "photo_id")

#  Users have many comments, a comment belongs to a user
#  Users have many likes, a like belongs to a user
#  Photos have many likes, a like belongs to a photo
has_many( :likes, :class_name => "Like", :foreign_key => "photo_id")
#  Users have many liked_photos through likes. Since this breaks naming conventions (the method name, .liked_photos, does not exactly match the class name, Photo), we'll have to write out the full form of the has_many/through:
# Similarly, Photos have many fans through likes (source: user):
has_many( :fans, :through => "likes", :foreign_key => "photo_id")

# Validations

# User
# username: presence, uniqueness
# Photo
# user_id: presence
validates :user_id, :presence => true
# Like
# user_id: presence, uniqueness in combination with photo
# photo_id: presence
# Comment
# user_id: presence
# photo_id: presence
# body: presence

end
