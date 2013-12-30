class GalleryMedium < ActiveRecord::Base

  attr_accessible :imageable_id, :imageable_type, :medium_id


  #  Associations
  #-----------------------------------------------
  belongs_to :imageable, polymorphic: true

end
