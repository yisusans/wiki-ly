class Tag < ActiveRecord::Base

  has_many :designations
  has_many :articles, through: :designations

  validates :label, presence: true

  def new_valid_tag?(article, label)
    if label.present?
      @tag = Tag.find_or_create_by(label: label)
      @tag.valid_tag?(article)
    end
  end

  def valid_tag?(article)
    if self.valid?
      @designation = Designation.create(tag_id: self.id, article_id: article.id)
    end
  end

end
