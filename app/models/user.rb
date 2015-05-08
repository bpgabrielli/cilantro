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
    recent = user.tags.create(title: "Latest Recipes", color: "#979797")
    brunch = user.tags.create(title: "Breakfast & Brunch", color: "#EA7635")
    vegetarian = user.tags.create(title: "Vegetarian", color: "#0C8243")
    appetizers = user.tags.create(title: "Appetizers", color: "#5E82C1")
    drinks = user.tags.create(title: "Drinks", color: "#6F459B")
    meat = user.tags.create(title: "Meat", color: "#D14D52")
    pasta = user.tags.create(title: "Pasta", color: "#28B893")
    poultry = user.tags.create(title: "Poultry", color: "#F2A82F")
    salad = user.tags.create(title: "Salad", color: "#42B149")
    seafood = user.tags.create(title: "Seafood", color: "#2E7FC2")
    soups = user.tags.create(title: "Soups & Stews", color: "#9F6F4C")
    mains = user.tags.create(title: "Main Course", color: "#4AB9D2")
    sides = user.tags.create(title: "Side Dishes", color: "#D44393")
    dessert = user.tags.create(title: "Dessert", color: "#6F64AD")
    weekday = user.tags.create(title: "Weekday", color: "#BBBBBB")
    weekend = user.tags.create(title: "Weekend Projects", color: "#76C58C")
  end
end
