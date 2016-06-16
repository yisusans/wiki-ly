class Article < ActiveRecord::Base

  belongs_to :group
  belongs_to :writer, class_name: "User"
  has_many :designations
  has_many :edits
  has_many :sections
  accepts_nested_attributes_for :sections
  has_many :favorites
  has_many :tags, through: :designations


  validates :title, :bibliography, presence: true
  validates_associated :sections, presence: true
end
