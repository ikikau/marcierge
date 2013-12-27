
class Information < ActiveRecord::Base

  extend Enumerize

  attr_accessible :content, :status, :title

  enumerize :status,
    in: {
      private: 0,
      public: 1,
    },
    default: :private,
    predicates: true


  #  Validations
  #-----------------------------------------------
  validates :title, presence: true


  #  Scope
  #-----------------------------------------------
  scope :private, -> { where status: :private }
  scope :public, -> { where status: :public }

end

