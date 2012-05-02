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
    member = self
    # does the member have any followers?
    if member.outta.any?
      # create a hash with member's first-order followers
      hash = followers(member)
      # iterate over each first-order follower
      hash.each_key do |member|
        # does the first-order follower have any followers?
        if member.outta.any?
          # create a hash with follower's second-order followers
          sub_hash = followers(member)
          # insert a hash of second-order followers as a value of the first-order follower's key
          hash[member].replace(sub_hash).each_key do |member2|
            if member2.outta.any?
              sub_hash = followers(member2)
              hash[member][member2].replace(sub_hash).each_key do |member3|
                if member3.outta.any?
                  sub_hash = followers(member3)
                  hash[member][member2][member3].replace(sub_hash).each_key do |member4|
                    if member4.outta.any?
                      sub_hash = followers(member4)
                      hash[member][member2][member3][member4].replace(sub_hash).each_key do |member5|
                        if member5.outta.any?
                          sub_hash = followers(member5)
                          hash[member][member2][member3][member4][member5].replace(sub_hash).each_key do |member6|
                            if member6.outta.any?
                              sub_hash = followers(member6)
                              hash[member][member2][member3][member4][member5][member6].replace(sub_hash).each_key do |member7|
                                if member7.outta.any?
                                  sub_hash = followers(member7)
                                  hash[member][member2][member3][member4][member5][member6][member7].replace(sub_hash).each_key do |member8|
                                    if member8.outta.any?
                                      sub_hash = followers(member8)
                                      hash[member][member2][member3][member4][member5][member6][member7][member8]
                                      # base = { user = { user = {}}}
                                      # cur = base
                                      # cur = cur[user]
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    return hash
  end


  def followers(member)
    # initialize a hash of first-order followers
    outters = Hash.new
    # iterate over members' followers
    member.outta.each do |username|
      # associate the follower's username with the object
      user = Member.find(username)
      # in the hash of first-order followers, object is the key and an empty hash is the value
      outters[user] = Hash.new
    end
    return outters
  end

  def hash_into
    intos = Hash.new
    if self.into.any?
      self.into.each do |username|
        user = Member.find(username)
        intos[user] = user.hash_into
      end
    end
    return intos
  end  
  
end