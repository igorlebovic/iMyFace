class Member

# require "./app/models/member.rb"

  attr_reader :first_name, :last_name, :username, :password, :outta, :into
  # :user1 => ["Igor", "Lebovic", "igor", "testing", ["john" => ["igor", "jason" => ["john", "jeff" => ["john", "jason"]]], "jason" => ["john" => ["igor", "jason" => ["john", "jeff" => ["john", "jason"]]], "jeff" => ["john" => ["igor", "jason"], "jason"]]], ["jason", "jeff"]],
  # :user2 => ["John", "Miller", "john", "testing", ["igor", "jason"], ["igor", "jeff"]],
  # :user3 => ["Jason", "Miller", "jason", "testing", ["john", "jeff"], ["igor", "jeff"]],
  # :user4 => ["Jeff", "Miller", "jeff", "testing", ["john", "jason"], ["igor", "jason"]]      
  def self.all
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
  
  def hash_outta
    outters = Hash.new
    usernames = Hash.new
    if self.outta.any?
      self.outta.each do |username|
        if usernames.include?(username)
          next
        else
          usernames[username] = username
          user = Member.find(username)
          outters[user] = user.hash_outta
        end
      end
    end
    return outters
  end

  def hash_into
    intos = Hash.new
    usernames = Hash.new
    if self.into.any?
      self.into.each do |username|
        if usernames.include?(username)
          next
        else
          usernames[username] = username
          user = Member.find(username)
          intos[user] = user.hash_into
        end
      end
    end
    return intos
  end  
  
end