class User < ApplicationRecord
  # The attributes have a default value to an empty hash
  attr_accessor :name, :email
  has_many :microposts
  validates :name, presence: true
  validates :email, presence: true

  #The first method, initialize, is special in Ruby;
  # it's the method called when we execute User.new
  # This one takes one argument - attributes = {}
  # Which we created with line 2 - attr_accessor :name, :email
  # This method sets global variable @name to attr_accessor :name
  # This method sets global variable @email to attr_accessor :email
  def initialize(attributes = {})
    @name  = attributes[:name]
    @email = attributes[:email]
  end

  #method called formatted_email that uses the values of the assigned
  # to build up a nicely formatted version of the user’s email address
  # using string interpolation
  def formatted_email
    "#{@name} <#{@email}>"
  end
end
