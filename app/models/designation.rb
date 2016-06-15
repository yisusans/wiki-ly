class Designation < ActiveRecord::Base

  has_many :tags
  has_many :articles

end
