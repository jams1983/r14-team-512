class Group < ActiveRecord::Base

  # Relations
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  belongs_to :owner, class_name: :User, foreign_key: :owner_id, inverse_of: :owned_groups
  accepts_nested_attributes_for :users, :reject_if => :all_blank, :allow_destroy => true

  #Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :couch_date, presence: true


end
