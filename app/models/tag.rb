class Tag < ActiveRecord::Base

  has_many :designations
  has_many :articles, through: :designations

end
