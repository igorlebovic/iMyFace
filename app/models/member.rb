class Member

# require "./app/models/member.rb"

  attr_reader :first_name, :last_name, :username, :password
  
  def self.all
    @members ||= {:user1 => ["Igor", "Lebovic", "aerosmile", "testing"],
                  :user2 => ["John", "Miller", "mr_awesome", "testing"]
                  }.map { |k, v| new(first_name: v[0], last_name: v[1], username: v[2], password: v[3]) }
  end
  
  def self.find(param)
    all.detect { |l| l.username.to_param == param } || raise(ActiveRecord::RecordNotFound)
  end

  def initialize(options = {})
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @username = options[:username]
    @password = options[:password]
  end
  
end