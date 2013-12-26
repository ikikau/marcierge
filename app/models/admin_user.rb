
class Admin < ActiveRecord::Base

  attr_accessible :name, :user_id


  #  Associations
  #-----------------------------------------------
  belongs_to :user


  #  Validations
  #-----------------------------------------------
  validates :user, presence: true
  validates :user_id, numericality: true
  validates :name, presence: true


  #  Avatar
  #-----------------------------------------------
  def avatar_url(size = 48)
    gravatar_id = Digest::MD5.hexdigest self.user.email.downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=identicon"
  end

end

