class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :code, :category, :locality_id, :language, :localities, :locality_ids
  
  has_many :surveys, :foreign_key => 'created_by', :order => 'locality_id, mediator_survey_counter'
  has_many :children, :class_name => 'ChildProfile', :foreign_key => :created_by
  has_many :families, :class_name => 'FamilyProfile', :foreign_key => :created_by
  belongs_to :locality
  has_many :localities, :through => :registrations
  has_many :registrations
  
  def boss
    if self.category == 'LDB'
      User.find(:first, :conditions => ["localities.id in (?) and category='L'",locality_ids], :include => :localities)
    else
      nil
    end
  end
  
  def mediators
    regs = Registration.where(:locality_id  => localities).select(:user_id).group(:user_id).map(&:user_id)
    # us = ''
    # regs.collect do |r| 
    #   us = r.user
    # end
    #logger.info regs.inspect
    # us
    User.where(:id => regs, :category => ['MED','L','LDB']).order('locality_id,category,code')
    # b
    # localities.each do |l|
    #   a = l.mediator_ids
    # end
    # b = User.all(a)
    # b
  end
  
  def institutions
    Institution.where(:locality_id => self.localities).order(:locality_id,:code_id,:name)
  end
  
  def full_name
    "#{first_name}" " " "#{last_name}"
  end

  def mediator_name
    "#{code}" " – " "#{full_name}"
  end
  
  def my_surveys
    if self.category == 'A'
      Survey.where('surveys.locality_id > 0').order('surveys.locality_id, mediator_survey_counter')
    elsif self.category == 'L'
      Survey.where("surveys.locality_id in(" + self.locality_ids*"," + ")").order('surveys.locality_id, mediator_survey_counter')
    else
      surveys
    end
  end

  def my_localities_surveys
    unless self.localities.blank?
      Surveys.where('locality_id in('+ self.locality_ids*"," + ')').order('locality_id, mediator_survey_counter')
    else
      self.locality
    end
  end
  
  def self.categories
    {
      "local partner team leader" => 'L',
      "local partner advanced DB entry" => 'LDB',
      "local partner simple DB entry" => 'LDB',
      "country facilitator, country officer" => "C",
      "REF - management" => "REF",
      "WB, UNDP, SGI" => "ME",
      "administrator" => "A",
      "mediator without access to DB" => "MED"
    }
  end

  def localities_db
    if  ['REF','ME'].include? self.category
      Locality.find(:all)
    else
      unless self.localitiess.blank?
        Locality.find(:all,:conditions => "id in(" + self.localitiess+")")
      end
    end
  end
  
end
