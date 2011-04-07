class Institution < ActiveRecord::Base
  belongs_to :code, :class_name => 'MenuItem', :foreign_key => 'code_id'
  has_many :children, :class_name => 'ChildProfile'
  belongs_to :locality

  def has_children?
    self.children.size > 0
  end
  
  def after_initialize
    if self.id==51
      self.name = I18n.t(self.name)
    end
  end

end
