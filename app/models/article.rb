class Article < ActiveRecord::Base

  belongs_to :group
  belongs_to :writer, class_name: "User"
  has_many :designations
  has_many :edits
  has_many :favorites
  has_many :tags, through: :designations

  validates :title, :body, presence: true

  def is_favorited?(current_user)
    !!self.favorites.find_by(user_id: current_user.id)
  end

  def self.search(search)
    where("LOWER(title) LIKE LOWER(?)", "%#{search}%")
    where("LOWER(body) LIKE LOWER(?)", "%#{search}%")
  end

end
