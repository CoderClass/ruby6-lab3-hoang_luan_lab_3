class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true

  def self.alphabetical
    Product.all.order('name DESC')
  end

  def discount_amount
    case price_vnd
      when 0.. 100000
        0
      when 100000.. 200000
        price_vnd * 0.21
      when 200000.. 800000
        price_vnd * 0.31
      else
        price_vnd * 0.41
    end
  end

  def final_price
    (((price_vnd - discount_amount)/10000).ceil)*10000
  end

  private

  def set_default_image_path
    self.image_path ||= "http://lorempixel.com/200/200/fashion"
  end



end
