class Section < ActiveRecord::Base

  belongs_to :article
  has_many :footnotes
  has_many :edits

end
