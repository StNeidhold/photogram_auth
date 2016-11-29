class Like < ActiveRecord::Base

#  Associations

#  Users have many photos, a photo belongs to a user
#  Photos have many comments, a comment belongs to a photo
#  Users have many comments, a comment belongs to a user
#  Users have many likes, a like belongs to a user
belongs_to( :user, :class_name => "User", :foreign_key => "user_id")
#  Photos have many likes, a like belongs to a photo
belongs_to( :photo, :class_name => "Photo", :foreign_key => "photo_id")
#  Users have many liked_photos through likes. Since this breaks naming conventions (the method name, .liked_photos, does not exactly match the class name, Photo), we'll have to write out the full form of the has_many/through:
# Similarly, Photos have many fans through likes (source: user):

# Validations

# User
# username: presence, uniqueness
# Photo
# user_id: presence
# Like
  # user_id: presence, uniqueness in combination with photo
  validates :user_id, :presence => true, :uniqueness => { :scope => :photo_id}
  # photo_id: presence
  validates :photo_id, :presence => true
# Comment
# user_id: presence
# photo_id: presence
# body: presence
end
