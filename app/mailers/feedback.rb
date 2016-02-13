class Feedback
  include ActiveModel::Model
    
  attr_accessor :from, :comment

  validates :from, :comment, presence: true
  validates :from, email: true  # it will triggered the validation in validaors/email_validator.rb
end