class Edit < ActiveRecord::Base

  has_many :editors, class_name: "User"
  belongs_to :section
  belongs_to :article

end
