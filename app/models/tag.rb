class Tag < ActiveRecord::Base

  belongs_to :user
  has_many :taggings
  has_many :recipes, through: :taggings

end
