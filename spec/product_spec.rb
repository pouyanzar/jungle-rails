require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should save the product successfully' do
        @category = Category.new
        @product = Product.new(:name => 'Strange product', :category => @category, :quantity => 4, :price => 2000)
        expect(@product).to be_valid
    end
    it 'should not save the product due to name is nil' do
      @category = Category.new
      @product = Product.new(:category => @category, :quantity => 4, :price => 2000)
      @product.save
      puts @product.errors.full_messages.inspect
      expect(@product).to_not be_valid
    end
    it 'should not save the product due to category is nil ' do
      @category = Category.new
      @product = Product.new(:name => 'Strange product', :quantity => 4, :price => 2000)
      @product.save
      puts @product.errors.full_messages.inspect
      expect(@product).to_not be_valid
    end
    it 'should not save the product due to quantity is nil' do
      @category = Category.new
      @product = Product.new(:name => 'Strange product', :category => @category, :price => 2000)
      @product.save
      puts @product.errors.full_messages.inspect
      expect(@product).to_not be_valid
    end
    it 'should not save the product due to price is nil' do
      @category = Category.new
      @product = Product.new(:name => 'Strange product', :category => @category, :quantity => 4)
      @product.save
      puts @product.errors.full_messages.inspect
      expect(@product).to_not be_valid
    end
  end
end