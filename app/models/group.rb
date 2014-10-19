class Group < ActiveRecord::Base

  # Relations
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :movies, dependent: :destroy
  belongs_to :owner, class_name: :User, foreign_key: :owner_id, inverse_of: :owned_groups
  accepts_nested_attributes_for :movies, :reject_if => :all_blank, :allow_destroy => true


  #Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :couch_date, presence: true

def total_votes
  total_votes = 0
  self.movies.select{ |m|  total_votes += m.votes_for.size }
  total_votes
end

end
