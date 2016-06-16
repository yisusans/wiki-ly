class Designation < ActiveRecord::Base

  belongs_to :tag
  belongs_to :article

  # validates :tags, :articles, presence: true
end
