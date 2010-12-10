class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :code, :category, :locality_id, :language
  
  has_many :surveys
  has_many :children, :class_name => 'ChildProfile'
  has_many :families, :class_name => 'FamilyProfile'
  belongs_to :locality

  def full_name
    "#{first_name}" " " "#{last_name}"
  end
end