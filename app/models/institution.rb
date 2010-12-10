class Institution < ActiveRecord::Base
  belongs_to :code, :class_name => 'MenuItem', :foreign_key => 'code_id'
  has_many :children
  belongs_to :locality
  
  def after_initialize
    if self.id==51
      self.name = I18n.t(self.name)
    end
  end
  
end
