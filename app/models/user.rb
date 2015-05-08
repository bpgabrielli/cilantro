class User < ActiveRecord::Base
  after_create :create_sample_tags

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes
  has_many :tags
  has_many :taggings

  private

  def create_sample_tags
    user = User.last
    recent = user.tags.create(title: "latest recipes", color: "#979797")
    brunch = user.tags.create(title: "breakfast & brunch", color: "#EA7635")
    vegetarian = user.tags.create(title: "vegetarian", color: "#0C8243")
    appetizers = user.tags.create(title: "appetizers", color: "#5E82C1")
    drinks = user.tags.create(title: "drinks", color: "#6F459B")
    meat = user.tags.create(title: "meat", color: "#D14D52")
    pasta = user.tags.create(title: "pasta", color: "#28B893")
    poultry = user.tags.create(title: "poultry", color: "#F2A82F")
    salad = user.tags.create(title: "salad", color: "#42B149")
    seafood = user.tags.create(title: "seafood", color: "#2E7FC2")
    soups = user.tags.create(title: "soups & stews", color: "#9F6F4C")
    mains = user.tags.create(title: "main course", color: "#4AB9D2")
    sides = user.tags.create(title: "side dishes", color: "#D44393")
    dessert = user.tags.create(title: "dessert", color: "#6F64AD")
    weekday = user.tags.create(title: "weekday", color: "#BBBBBB")
    weekend = user.tags.create(title: "weekend projects", color: "#76C58C")
  end
end
