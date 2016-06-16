class Designation < ActiveRecord::Base

  belongs_to :tag
  belongs_to :article

  validates :tag, :article, presence: true
end
