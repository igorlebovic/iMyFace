# module MembersHelper
#   def nested_outta(outtas)
#     outtas.map do |follower, sub_followers|
#       member.outta.each do |username|
#         user = Member.find(username)
#         render(:partial => "user", :locals => {:user => user}) + nested_outta(user)
#       end.join.html_safe
#     end
#   end
# end

module MembersHelper
  def nested_outta(outtas)
    outtas.map do |follower, sub_followers|
      render(:partial => "user", :locals => {:user => follower}) + content_tag(:div, nested_outta(sub_followers), :class => "nested_messages")
    end.join.html_safe
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
