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

  def is_favorited?(current_user)
    !!self.favorites.find_by(user_id: current_user.id)
  end

  # def is_favorited?
  #   self.user.favorites.select do |favorite|
  #     favorite.where(user_id == current_user.id && article_id == @article.id)
  #   end
  # end


end
