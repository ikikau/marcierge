
class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  attr_readonly :sign_in_count, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_at, :last_sign_in_ip


  #  Associations
  #-----------------------------------------------
  has_one :admin
  has_one :creator


  #  Validations
  #-----------------------------------------------
  validates :email, presence: true
  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { in: 4..20 },
    format: { with: /\A[a-z][a-z0-9]+\z/ },
    exclusion: { in: ENV['RESERVED_WORDS'].split(' ') }


  #  Devise
  #-----------------------------------------------
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
    # :confirmable


  #  Set current user
  #-----------------------------------------------
  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end


  #  User role
  #-----------------------------------------------
  def admin?
    admin.present?
  end
  def creator?
    creator.present?
  end

end

