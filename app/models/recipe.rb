class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  # has_many :ingredients
  # has_many :steps

  def all_tags=(names)
    tag_palette = ["#979797", "#EA7635", "#0C8243", "#5E82C1", "#6F459B", "#D14D52", "#28B893", "#F2A82F", "#42B149", "#2E7FC2", "#9F6F4C", "#4AB9D2", "#D44393", "#6F64AD", "#BBBBBB", "#76C58C"]
    self.tags = names.split(",").map do |title|
      Tag.where(title: title.strip.downcase, user_id: self.user_id, color: tag_palette.sample).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:title).join(", ")
  end

end