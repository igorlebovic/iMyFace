# module MembersHelper
#   def nested_outta(member)
#     if member.outta.any?
#       user = Member.find(member.outta.first)
#       render(:partial => "user", :locals => {:user => user}) + nested_outta(user)
#     end
#   end
# end

module MembersHelper
  def nested_outta(member)
    if member.outta.any?
      member.outta.each do |username|
        user = Member.find(username)
        render(:partial => "user", :locals => {:user => user}) + nested_outta(user)
      end.join.html_safe
    end
  end
end

# member.outta.each do |username|
#         user = Member.find(username)
#         # redirect_to root_path
#         # render :text => "OK"
#         # render "user"
#         # nested_outta(user)
#         render :partial => "user", :locals => {:user => user}
#       end.join.html_safe
