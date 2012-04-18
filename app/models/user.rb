class User

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :fname, :lname
  
  validates_presence_of :fname, :lname

  # def initialize(fname, lname)
  #  @fname = fname
  #  @lname = lname
  # end
  # 
  # def to_s
  #    "Person: #@fname #@lname"
  # end
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end