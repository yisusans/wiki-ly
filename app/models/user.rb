class User < ActiveRecord::Base
  has_secure_password

  validates :email, :username, :password, presence: true, on: :create
  validates :email, :username, :password, presence: true, on: :update
  validates :email, :username, uniqueness: true, on: :create
  validates :email, :username, uniqueness: true, on: :update

  has_many :articles, {foreign_key: :writer_id}
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :edits, {foreign_key: :editor_id}
  has_many :favorites
  has_many :favorited_articles, through: :favorites, source: :article

end
