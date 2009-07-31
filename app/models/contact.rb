class Contact < ActiveRecord::Base
  belongs_to :user
  
  has_many :telephone_numbers
end
