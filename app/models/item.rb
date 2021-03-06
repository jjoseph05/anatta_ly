class Item < ActiveRecord::Base
  attr_accessible :name, :description, :size, :color, :image, :category_id, :price, :attachment, :user

  validates_presence_of :name, :description, :user_id, :image_file_name, :category_id, :price

  belongs_to :user
  belongs_to :category
  has_many :shares, dependent: :destroy
  has_many :borrows, through: :shares, class_name: "User"

  has_attached_file :image, styles: { medium: "300x300>", small:"200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  def self.items_of_friends(current_user)
    friends = Friend.get_friends(current_user)
    friends_ids = friends.map {|f| f.id}
    where(:user_id => friends_ids)
  end

  def self.search(search)
    if search
      where(['lower(name) LIKE ?', "%#{search.downcase}%"])
    else
      all
    end
  end

  def self.item_images
    images = []
    Item.all.sample(10).each do |item|
      images << item.image.url
    end
    images
  end
end
