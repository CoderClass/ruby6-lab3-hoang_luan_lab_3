require 'rails_helper'

RSpec.describe Product, type: :model do
  # Use .alphabetical because it's a class method. Example: Product.alphabetical
  # Use #long_name when #long_name is an instance method. Example: @product.long_name
  describe ".alphabetical" do
    it "returns [] when there are no products" do
      expect(Product.alphabetical).to eq []
    end

    it "returns [a] when there is only one product a" do
      a = Product.create(
          name: 'Cowboy Hat',
          description: 'A high-crowned, wide-brimmed hat best known as the defining piece of attire for the North American cowboy.',
          image_path: 'cowboy.jpg',
          price_vnd: 500000.0,
          weight: 600
      )
      expect(Product.alphabetical).to eq [a]
    end

    it "returns [a,b,c] after I create 3 products c, b, a" do
      a = Product.create(
          name: 'Cowboy Hat a',
          description: 'A high-crowned, wide-brimmed hat best known as the defining piece of attire for the North American cowboy.',
          image_path: 'cowboy.jpg',
          price_vnd: 500000.0,
          weight: 600
      )
      b = Product.create(
          name: 'Cowboy Hat b',
          description: 'A high-crowned, wide-brimmed hat best known as the defining piece of attire for the North American cowboy.',
          image_path: 'cowboy.jpg',
          price_vnd: 500000.0,
          weight: 600
      )
      c = Product.create(
          name: 'Cowboy Hat c',
          description: 'A high-crowned, wide-brimmed hat best known as the defining piece of attire for the North American cowboy.',
          image_path: 'cowboy.jpg',
          price_vnd: 500000.0,
          weight: 600
      )
      expect(Product.alphabetical).to eq [c, b, a]
    end
  end

  describe "Discount amount" do
    it "return 0 discount amount when product price < 100000" do
      a = Product.new(
          price_vnd: 99000
      )
      expect(a.discount_amount).to eq 0
    end

    it "return 42k when product price is 200000" do
      a = Product.new(price_vnd: 200000)
      expect(a.discount_amount). to eq 42000
    end

    it "return 96k when product price is 300000" do
      a = Product.new(price_vnd: 300000)
      expect(a.discount_amount). to eq 93000
    end

    it "return 155k when product price is 500000" do
      a = Product.new(price_vnd: 500000)
      expect(a.discount_amount). to eq 155000
    end

    it "return 369k when product price is 900000" do
      a = Product.new(price_vnd: 900000)
      expect(a.discount_amount). to eq 369000
    end
  end

end

