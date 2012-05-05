module MembersHelper
  def nested(members)
    members.map do |key, value|
      render(:partial => "user", :locals => {:user => key}) + content_tag(:div, nested(value), :class => "nested")
    end.join.html_safe
  end
end

def hash_outta(member)
  @excluded_outta = Set.new
    hash = member_followers(member)
    sub_followers(hash)
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

def sub_followers(hash)
  hash.each_key do |member|
    sub_hash = member_followers(member)
    hash[member].replace(sub_hash)
  end
  hash.each_pair do |key, follower_hash|
    follower_hash.each_key do |follower_member|
      sub_hash = member_followers(follower_member)
      sub_followers(hash[key][follower_member].replace(sub_hash))
    end
    # place rec function here
  end
end

# member_followers
# 1=>{}
# 2=>{}
# 3=>{}
# 
# sub_followers
# 1=>{1=>{},
#     2=>{},
#     3=>{}}
# 2=>{1=>{},
#     2=>{},
#     3=>{}}
# 3=>{1=>{},
#     2=>{},
#     3=>{}}
