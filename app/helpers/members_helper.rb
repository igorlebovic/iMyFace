module MembersHelper
  def nested_outta(outtas)
    outtas.map do |follower, sub_followers|
      render(:partial => "user", :locals => {:user => follower}) + content_tag(:div, nested_outta(sub_followers), :class => "nested")
    end.join.html_safe
  end
  
  def nested_into(intos)
    intos.map do |author, sub_authors|
      render(:partial => "user", :locals => {:user => author}) + content_tag(:div, nested_into(sub_authors), :class => "nested")
    end.join.html_safe
  end
end