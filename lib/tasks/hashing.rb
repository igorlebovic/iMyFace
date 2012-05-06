module Hashing

  def set_outta(username)
    @excluded_outta = Set.new
    @excluded_outta.add(username)
    hash = member_followers(username)
    sub_followers(hash)
    return @excluded_outta
  end

  def set_into(username)
    @excluded_into = Set.new
    @excluded_into.add(username)
    hash = member_following(username)
    sub_following(hash)
    return @excluded_into
  end

  def hash_outta(username)
    @excluded_outta = Set.new
    @excluded_outta.add(username)
    hash = member_followers(username)
    sub_followers(hash)
  end

  def hash_into(username)
    @excluded_into = Set.new
    @excluded_into.add(username)
    hash = member_following(username)
    sub_following(hash)
  end

  def member_followers(user)
    hash = Hash.new
    member = Member.find(user)
    member.outta.each do |username|
      unless @excluded_outta.include?(username)
        @excluded_outta.add(username)
        hash[username] = Hash.new
      end
    end
    return hash
  end

  def member_following(user)
    hash = Hash.new
    member = Member.find(user)
    member.into.each do |username|
      unless @excluded_into.include?(username)
        @excluded_into.add(username)
        hash[username] = Hash.new
      end
    end
    return hash
  end

  def sub_followers(hash)
    hash.each_key do |member|
      sub_hash = member_followers(member)
      hash[member].replace(sub_hash)
    end
    hash.each do |key, follower_hash|
      follower_hash.each_key do |follower_member|
        sub_hash = member_followers(follower_member)
        hash[key][follower_member].replace(sub_hash)
      end
    end
    hash.each do |key, follower_hash|
      follower_hash.each do |key2, follower_hash2|
        follower_hash2.each_key do |follower_member|
          sub_hash = member_followers(follower_member)
          hash[key][key2][follower_member].replace(sub_hash)
        end
      end
    end
    hash.each do |key, follower_hash|
      follower_hash.each do |key2, follower_hash2|
        follower_hash2.each do |key3, follower_hash3|
          follower_hash3.each_key do |follower_member|
            sub_hash = member_followers(follower_member)
            hash[key][key2][key3][follower_member].replace(sub_hash)
          end
        end
      end
    end
    hash.each do |key, follower_hash|
      follower_hash.each do |key2, follower_hash2|
        follower_hash2.each do |key3, follower_hash3|
          follower_hash3.each do |key4, follower_hash4|
            follower_hash4.each_key do |follower_member|
              sub_hash = member_followers(follower_member)
              hash[key][key2][key3][key4][follower_member].replace(sub_hash)
            end
          end
        end
      end
    end
    hash.each do |key, follower_hash|
      follower_hash.each do |key2, follower_hash2|
        follower_hash2.each do |key3, follower_hash3|
          follower_hash3.each do |key4, follower_hash4|
            follower_hash4.each do |key5, follower_hash5|
              follower_hash5.each_key do |follower_member|
                sub_hash = member_followers(follower_member)
                hash[key][key2][key3][key4][key5][follower_member].replace(sub_hash)
              end
            end
          end
        end
      end
    end
    hash.each do |key, follower_hash|
      follower_hash.each do |key2, follower_hash2|
        follower_hash2.each do |key3, follower_hash3|
          follower_hash3.each do |key4, follower_hash4|
            follower_hash4.each do |key5, follower_hash5|
              follower_hash5.each do |key6, follower_hash6|
                follower_hash6.each_key do |follower_member|
                  sub_hash = member_followers(follower_member)
                  hash[key][key2][key3][key4][key5][key6][follower_member].replace(sub_hash)
                end
              end
            end
          end
        end
      end
    end
  end

  def sub_following(hash)
    hash.each_key do |member|
      sub_hash = member_following(member)
      hash[member].replace(sub_hash)
    end
    hash.each do |key, follower_hash|
      follower_hash.each_key do |follower_member|
        sub_hash = member_following(follower_member)
        hash[key][follower_member].replace(sub_hash)
      end
    end
    hash.each do |key, follower_hash|
      follower_hash.each do |key2, follower_hash2|
        follower_hash2.each_key do |follower_member|
          sub_hash = member_following(follower_member)
          hash[key][key2][follower_member].replace(sub_hash)
        end
      end
    end
    hash.each do |key, follower_hash|
      follower_hash.each do |key2, follower_hash2|
        follower_hash2.each do |key3, follower_hash3|
          follower_hash3.each_key do |follower_member|
            sub_hash = member_following(follower_member)
            hash[key][key2][key3][follower_member].replace(sub_hash)
          end
        end
      end
    end
    hash.each do |key, follower_hash|
      follower_hash.each do |key2, follower_hash2|
        follower_hash2.each do |key3, follower_hash3|
          follower_hash3.each do |key4, follower_hash4|
            follower_hash4.each_key do |follower_member|
              sub_hash = member_following(follower_member)
              hash[key][key2][key3][key4][follower_member].replace(sub_hash)
            end
          end
        end
      end
    end
    hash.each do |key, follower_hash|
      follower_hash.each do |key2, follower_hash2|
        follower_hash2.each do |key3, follower_hash3|
          follower_hash3.each do |key4, follower_hash4|
            follower_hash4.each do |key5, follower_hash5|
              follower_hash5.each_key do |follower_member|
                sub_hash = member_following(follower_member)
                hash[key][key2][key3][key4][key5][follower_member].replace(sub_hash)
              end
            end
          end
        end
      end
    end
    hash.each do |key, follower_hash|
      follower_hash.each do |key2, follower_hash2|
        follower_hash2.each do |key3, follower_hash3|
          follower_hash3.each do |key4, follower_hash4|
            follower_hash4.each do |key5, follower_hash5|
              follower_hash5.each do |key6, follower_hash6|
                follower_hash6.each_key do |follower_member|
                  sub_hash = member_following(follower_member)
                  hash[key][key2][key3][key4][key5][key6][follower_member].replace(sub_hash)
                end
              end
            end
          end
        end
      end
    end
  end
  
end