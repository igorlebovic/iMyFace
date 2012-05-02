module MembersHelper
  def nested(members)
    members.map do |key, value|
      render(:partial => "user", :locals => {:user => key}) + content_tag(:div, nested(value), :class => "nested")
    end.join.html_safe
  end
end