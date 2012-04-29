class Member

# require "./app/models/member.rb"

  attr_reader :first_name, :last_name, :username, :password, :outta, :into
  
  def self.all
    # :user1 => ["Igor", "Lebovic", "igor", "testing", ["john", "jason"], ["jason", "jeff"]],
    # :user2 => ["John", "Miller", "john", "testing", ["igor", "jason"], ["igor", "jeff"]],
    # :user3 => ["Jason", "Miller", "jason", "testing", ["john", "jeff"], ["igor", "jeff"]],
    # :user4 => ["Jeff", "Miller", "jeff", "testing", ["john", "jason"], ["igor", "jason"]]    
    @members ||= {}.map { |k, v| new(first_name: v[0],
                                     last_name: v[1],
                                     username: v[2],
                                     password: v[3],
                                     outta: v[4],
                                     into: v[5]) }
  end

  def self.find(param)
    all.detect { |l| l.username.to_param == param } || raise(ActiveRecord::RecordNotFound)
  end

  def initialize(options = {})
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @username = options[:username]
    @password = options[:password]
    @outta = options[:outta]
    @into = options[:into]
  end
  
  def self.delete
    self.new(first_name: "", last_name: "", username: "", password: "", outta: "", into: "")
  end
  
end