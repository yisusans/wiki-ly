class Article < ActiveRecord::Base

  belongs_to :group
  belongs_to :writer, class_name: "User"
  has_many :designations
  has_many :edits
  has_many :sections
  has_many :favorites

  def is_favorited?(current_user)
    !!self.favorites.find_by(user_id: current_user.id)
  end

end
