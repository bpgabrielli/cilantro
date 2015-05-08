class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  # has_many :ingredients
  # has_many :steps

  def all_tags=(names)
    self.tags = names.split(",").map do |title|
      Tag.where(title: title.strip, user_id: self.user_id).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:title).join(", ")
  end

end
