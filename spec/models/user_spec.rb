require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it 'is valid with a name, password, and email' do
      user = User.new(
        name: 'arthur murray'
        password: '1234'
        password_confirmation:'1234'
        email: 'amurray@gmail.com'
      ) 
      expect (user).to be_valid
    end

    it "is invalid without a name" do 
      user = User.new(name: nil)
      user.valid?
      expect(user.error[:name]).to include ("cant be blank")
    end

    it "is invalid without a password" do 
      user = User.new(password: nil)
      user.valid?
      expect(user.error[:password]).to include ("cant be blank")
    end
    
    it "is invalid without a password_confirmation" do 
      user = User.new(password_confirmation: nil)
      user.valid?
      expect(user.error[:password_confirmation]).to include ("cant be blank")
    end

    it "password_confirmation matches password" do 
      user = User.new(password_confirmation: '1234')
      user.valid?
      expect(user.error[:password_confirmation]).to include ("must match password")
    end

    it "is invalid without a email" do 
      user = User.new(email: nil)
      user.valid?
      expect(user.error[:email]).to include ("cant be blank")
    end

    it 'is invalid with a duplicate email address' do
      User.create!(
        name: 'arthur murray',
        email: 'amurray@gmail.com',
        password: '1234'
      )
      user = User.new(
        name: 'bob',
        email: 'amurray@gmail.com',
        password: '7890'
      )
      user.valid?
      expect(user.errors[:email]).to include('email has already been taken')
    end

    it "password is too short" do 
      user = User.new(password: 123)
      user.valid?
      expect(user.error[:password]).to include ("password must be longer")
    end
end