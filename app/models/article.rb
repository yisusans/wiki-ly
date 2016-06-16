class Article < ActiveRecord::Base

  belongs_to :group
  belongs_to :writer, class_name: "User"
  has_many :designations
  has_many :edits
  has_many :sections
  has_many :favorites

	def self.search(search)
	  where("name LIKE ?", "%#{search}%") 
	  where("content LIKE ?", "%#{search}%")
	end
end
