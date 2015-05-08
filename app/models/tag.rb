class Tag < ActiveRecord::Base
  after_create :colorize

  belongs_to :user
  has_many :taggings
  has_many :recipes, through: :taggings

  def colorize
    tag = Tag.last
    tag_palette = ["#979797", "#EA7635", "#0C8243", "#5E82C1", "#6F459B", "#D14D52", "#28B893", "#F2A82F", "#42B149", "#2E7FC2", "#9F6F4C", "#4AB9D2", "#D44393", "#6F64AD", "#BBBBBB", "#76C58C"]
    tag.color = tag_palette.sample
  end

end
