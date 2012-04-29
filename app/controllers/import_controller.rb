class ImportController < ApplicationController

  def home
  end
  
  def faces
    contents = File.open('/Users/igorlebovic/csh/face/vendor/data/faces.dat', 'rb') { |f| f.read }
    contents.split(" ").each do |c| 
      data = c.split("|")
      @member = Member.new(first_name: data[0], last_name: data[1], username: data[2], password: data[3], outta: [], into: [])
      @members = Member.all.push(@member)
    end
    redirect_to members_path    
  end

  def connections
    contents = File.open('/Users/igorlebovic/csh/face/vendor/data/connections.dat', 'rb') { |f| f.read }
    contents.split("\n").each do |c|
      if c.split(" ").include?("InMyFace")
        data = c.split(" InMyFace ")
        @member = Member.find(data[0])
        @member.into.push(data[1])
      else
        data = c.split(" OuttaMyFace ")
        @member = Member.find(data[0])
        @member.outta.push(data[1])
      end
    end
    redirect_to members_path    
  end

  def posts
    contents = File.open('/Users/igorlebovic/csh/face/vendor/data/posts.dat', 'rb') { |f| f.read }
    contents.split(" ").each do |c| 
      data = c.split("|")
      @member = Member.new(first_name: data[0], last_name: data[1], username: data[2], password: data[3])
      @members = Member.all.push(@member)
    end
    redirect_to members_path    
  end
  
end