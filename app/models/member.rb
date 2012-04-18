class Member
  attr_reader :char
  
  def self.all
    @members ||= ('A'..'Z').map { |c| new(c) }
  end
  
  def self.find(param)
    all.detect { |l| l.to_param == param } || raise(ActiveRecord::RecordNotFound)
  end

  def initialize(char = 'ABC')
    @char = char
  end
  
  def to_param
    @char.downcase
  end
  
end