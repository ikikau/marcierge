
class Information < ActiveRecord::Base

  extend Enumerize

  attr_accessible :content, :status, :title

  enumerize :status,
    in: {
      private: 0,
      public: 1,
    },
    default: :private,
    predicates: true,
    scope: true


  #  Validations
  #-----------------------------------------------
  validates :title, presence: true
  validates :status,
    presence: true,
    inclusion: { in: %w[private public] }


  #  Scope
  #-----------------------------------------------
  scope :public, -> { with_status :public }
  scope :private, -> { with_status :private }


  #  Kaminari
  #-----------------------------------------------
  paginates_per 20

end

