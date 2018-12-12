class Meal < ApplicationRecord
    # belongs_to :meal_category
    has_one_attached :image
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true

    after_create :SetImage
    def SetImage
        unless self.image.attached?
            self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'donnut.jpg')),filename: 'donnut.jpg', content_type: 'image/jpg')
        end
    end
end
