module MembersHelper
  
  include Hashing
  
  def nested(members, i=0)
    i = i + 1
    members.map do |key, value|
      render(:partial => "user", :locals => {:user => key, :i => i}) + content_tag(:div, nested(value, i), :class => "nested")
    end.join.html_safe
  end
end