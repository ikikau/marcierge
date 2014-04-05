class Creator < ActiveRecord::Base

  attr_accessible :avatar_id, :user_id
  attr_accessible :name, :profile


  #  Associations
  #-----------------------------------------------
  belongs_to :avatar, class_name: '::Medium'
  has_many :join_events, class_name: '::CreatorJoinEvent', dependent: :destroy
  has_many :events, through: :join_events, foreign_key: :event_id
  belongs_to :user, dependent: :destroy


  #  Validations
  #-----------------------------------------------
  validates :name, presence: true


  #  Scope
  #-----------------------------------------------
  scope :without_user, -> { where user_id: nil }


  #  Kaminari
  #-----------------------------------------------
  paginates_per 50


  #  Avatar
  #-----------------------------------------------
  def avatar_url(size = 48)
    size = size.to_i

    if self.user.present?
      gravatar_id = Digest::MD5.hexdigest self.user.email.downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=identicon"
    else
      "http://placehold.it/#{size}x#{size}"
    end
  end

end
