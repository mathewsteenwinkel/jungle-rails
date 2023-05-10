require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new(name: 'fern')
    @category.save
  end

  RSpec.describe Product, type: :model do
    describe 'Validations' do
      it.'ensures that a product with all four fields set will indeed save successfully' do
        @product = Product.new(name: 'fern', price: 5000, quantity: 1, category: @category)
        expect(@product)to be_valid
      end

      it.'validates name'do
        @product = Product.new(name: nil, price: 5000, quantity: 1, category: @category)
        @product.save
        expect(@product.errors.full_messages).to include("name can't be blank")
        end

      it.'validates price' do 
        @product = Product.new(name: 'fern', price: nil, quantity: 1, category: @category)
        @product.save
        expect(@product.errors.full_messages).to include("price can't be blank")
      end

      it.'validates quantity' do 
        @product = Product.new(name: 'fern', price: 5000, quantity: nil, category: @category)
        @product.save
        expect(@product.errors.full_messages).to include("quantity can't be blank")
      end

      it.'validates category' do 
        @product = Product.new(name: 'fern', price: 5000, quantity: 1, category: nil)
        @product.save
        expect(@product.errors.full_messages).to include("category must be picked")

      end
    end



  end