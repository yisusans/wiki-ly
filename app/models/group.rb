class Group < ActiveRecord::Base

  has_many :memberships
  has_many :articles
  has_many :users, through: :memberships

  validates :name, presence: true

  	def self.search(search)
	  where("name LIKE ?", "%#{search}%") 
	end
end
