class Member

  attr_reader :first_name, :last_name, :username, :password, :outta, :into
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
    @excluded_outta = Set.new
    if member.outta.any?
      hash = followers(member)
      hash.each_key do |member|
        if member.outta.any?
          sub_hash = followers(member)
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
                                      hash[member][member2][member3][member4][member5][member6][member7][member8].replace(sub_hash).each_key do |member9|
                                        if member9.outta.any?
                                          sub_hash = followers(member9)
                                          hash[member][member2][member3][member4][member5][member6][member7][member8][member9].replace(sub_hash).each_key do |member10|
                                            if member10.outta.any?
                                              sub_hash = followers(member10)
                                              hash[member][member2][member3][member4][member5][member6][member7][member8][member9][member10].replace(sub_hash).each_key do |member11|
                                                if member11.outta.any?
                                                  sub_hash = followers(member11)
                                                  hash[member][member2][member3][member4][member5][member6][member7][member8][member9][member10][member11].replace(sub_hash).each_key do |member12|
                                                    if member12.outta.any?
                                                      sub_hash = followers(member12)
                                                      hash[member][member2][member3][member4][member5][member6][member7][member8][member9][member10][member11][member12]
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

  # raise @excluded.inspect
  
  # base = { user = { user = {}}}
  # cur = base
  # cur = cur[user]

  def hash_into
    member = self
    @excluded_into = Set.new
    if member.into.any?
      hash = following(member)
      hash.each_key do |member|
        if member.into.any?
          sub_hash = following(member)
          hash[member].replace(sub_hash).each_key do |member2|
            if member2.into.any?
              sub_hash = following(member2)
              hash[member][member2].replace(sub_hash).each_key do |member3|
                if member3.into.any?
                  sub_hash = following(member3)
                  hash[member][member2][member3].replace(sub_hash).each_key do |member4|
                    if member4.into.any?
                      sub_hash = following(member4)
                      hash[member][member2][member3][member4].replace(sub_hash).each_key do |member5|
                        if member5.into.any?
                          sub_hash = following(member5)
                          hash[member][member2][member3][member4][member5].replace(sub_hash).each_key do |member6|
                            if member6.into.any?
                              sub_hash = following(member6)
                              hash[member][member2][member3][member4][member5][member6].replace(sub_hash).each_key do |member7|
                                if member7.into.any?
                                  sub_hash = following(member7)
                                  hash[member][member2][member3][member4][member5][member6][member7].replace(sub_hash).each_key do |member8|
                                    if member8.into.any?
                                      sub_hash = following(member8)
                                      hash[member][member2][member3][member4][member5][member6][member7][member8].replace(sub_hash).each_key do |member9|
                                        if member9.outta.any?
                                          sub_hash = following(member9)
                                          hash[member][member2][member3][member4][member5][member6][member7][member8][member9].replace(sub_hash).each_key do |member10|
                                            if member10.outta.any?
                                              sub_hash = following(member10)
                                              hash[member][member2][member3][member4][member5][member6][member7][member8][member9][member10].replace(sub_hash).each_key do |member11|
                                                if member11.outta.any?
                                                  sub_hash = following(member11)
                                                  hash[member][member2][member3][member4][member5][member6][member7][member8][member9][member10][member11].replace(sub_hash).each_key do |member12|
                                                    if member12.outta.any?
                                                      sub_hash = following(member12)
                                                      hash[member][member2][member3][member4][member5][member6][member7][member8][member9][member10][member11][member12]
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
    hash = Hash.new
    member.outta.each do |username|
      unless @excluded_outta.include?(username)
        @excluded_outta.add(username)      
        user = Member.find(username)
        hash[user] = Hash.new
      end
    end
    return hash
  end

  def following(member)
    hash = Hash.new
    member.into.each do |username|
      unless @excluded_into.include?(username)
        @excluded_into.add(username)      
        user = Member.find(username)
        hash[user] = Hash.new
      end
    end
    return hash
  end

end