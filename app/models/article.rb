class Article < ActiveRecord::Base

  belongs_to :group
  belongs_to :writer, class_name: "User"
  has_many :designations
  has_many :edits
  has_many :sections

end
