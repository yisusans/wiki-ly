class User < ActiveRecord::Base
  has_secure_password

  has_many :articles, {foreign_key: :writer_id}
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :edits, {foreign_key: :editor_id}
  has_many :favorites


end
