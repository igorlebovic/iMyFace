module MembersHelper
  def nested(members, i=0)
    i = i + 1
    members.map do |key, value|
      render(:partial => "user", :locals => {:user => key, :i => i}) + content_tag(:div, nested(value, i), :class => "nested")
    end.join.html_safe
  end
end

def hash_outta(member)
  @excluded_outta = Set.new
  hash = member_followers(member)
  sub_followers(hash)
end

def hash_into(member)
  @excluded_into = Set.new
  hash = member_following(member)
  sub_following(hash)
end

def member_followers(member)
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

def member_following(member)
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