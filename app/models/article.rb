class Article < ActiveRecord::Base

  belongs_to :group
  belongs_to :writer, class_name: "User"
  has_many :designations
  has_many :edits
  has_many :sections
  # accepts_nested_attributes_for :sections
  has_many :favorites

  validates :title, :bibliography, presence: true
  validates_associated :sections, presence: true

  def section_getter
    section
  end

  def subtitle=(val)
    if subtitle
      subtitle.update_attributes(value: val)
    else
      subtitle = Section.create(value: val)
    end
  end

  # def body=(val)
  #   self.sections.body = value
  # end

end
