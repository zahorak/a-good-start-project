class Locality < ActiveRecord::Base
  has_many :surveys
  belongs_to :country
  has_many :children, :through => :surveys
  has_many :children_below_seven, :through => :surveys
  has_many :completed_surveys, :class_name => "Survey", :conditions => {:completed => 1}
  has_many :mediators, :class_name => "User", :foreign_key => :locality_id
  has_many :users, :through => :registrations
  has_many :registrations
  
  has_many :children_at_home, :through => :surveys, :conditions =>  {:institution_id => 51}
  
  def full_name
    "#{code}" " - " "#{city}"
  end

  # def completed_surveys
  #   surveys(:conditions => {:completed => 1})
  # end

  def verified?
    verified==1 ? "Yes" : "No"
  end
  
end
