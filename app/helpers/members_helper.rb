module MembersHelper
  def nested_outta(member)
    if member.outta.any?
      member.outta.each do |username|
        user = Member.find(username)
        render(:partial => "members/user", :locals => {:user => user})
         # + nested_outta(user)
      end
    end
  end
end