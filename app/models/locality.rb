class Locality < ActiveRecord::Base
  has_many :surveys
  belongs_to :country
  # has_many :users
  
  def full_name
    "#{code}" " - " "#{city}"
  end
end
