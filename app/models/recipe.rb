class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  # has_many :ingredients
  # has_many :steps

  scope :tagged_with_any, ->(tag_names){ joins(:tags).where(tags: {title: tag_names }) }
  scope :tagged_with_all, ->(tag_names){ tagged_with_any(tag_names).group("recipes.id").having("count(distinct tags.id) = ?", tag_names.uniq.size) }
  scope :favorited, -> {where(star: true)}
  scope :favorited_and_tagged_with_all, ->(tag_names){ tagged_with_all(tag_names).where(star: true) }

  def all_tags=(titles)
    tag_palette = ["#979797", "#EA7635", "#0C8243", "#5E82C1", "#6F459B", "#D14D52", "#28B893", "#F2A82F", "#42B149", "#2E7FC2", "#9F6F4C", "#4AB9D2", "#D44393", "#6F64AD", "#BBBBBB", "#76C58C"]
    self.tags = titles.split(",").map do |title|
      Tag.where(title: title.strip.downcase, user_id: self.user_id).first_or_initialize do |tag|
        tag.color = tag_palette.sample
        tag.save
      end
    end
  end

  def all_tags
    self.tags.map(&:title).join(", ")
  end

end