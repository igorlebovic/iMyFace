class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def import_faces_small
    contents = File.open('./vendor/data/faces.dat', 'rb') { |f| f.read }
    contents.split(" ").each do |c|
      data = c.split("|")
      member = Member.new(first_name: data[0], last_name: data[1], username: data[2], password: data[3], outta: [], into: [])
      Member.all.push(member)
    end
  end

  def import_faces_large
    contents = File.open('./vendor/data/faces2.dat', 'rb') { |f| f.read }
    contents.split(" ").each do |c|
      data = c.split("|")
      member = Member.new(first_name: data[0], last_name: data[1], username: data[2], password: data[3], outta: [], into: [])
      Member.all.push(member)
    end
  end

  def import_faces_large_cycles
    contents = File.open('./vendor/data/faces3.dat', 'rb') { |f| f.read }
    contents.split(" ").each do |c|
      data = c.split("|")
      member = Member.new(first_name: data[0], last_name: data[1], username: data[2], password: data[3], outta: [], into: [])
      Member.all.push(member)
    end
  end

  def import_connections_small
    contents = File.open('./vendor/data/connections.dat', 'rb') { |f| f.read }
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
  end

  def import_connections_large
    contents = File.open('./vendor/data/connections2.dat', 'rb') { |f| f.read }
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
  end

  def import_connections_large_cycles
    contents = File.open('./vendor/data/connections3.dat', 'rb') { |f| f.read }
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
  end
  
  def import_posts_small
    contents = File.open('./vendor/data/posts.dat', 'rb') { |f| f.read }
    contents.split(" ").each do |c| 
      data = c.split("|")
      @member = Member.new(first_name: data[0], last_name: data[1], username: data[2], password: data[3])
      @members = Member.all.push(@member)
    end
  end
  
  def import_posts_large
    contents = File.open('./vendor/data/posts2.dat', 'rb') { |f| f.read }
    contents.split(" ").each do |c| 
      data = c.split("|")
      @member = Member.new(first_name: data[0], last_name: data[1], username: data[2], password: data[3])
      @members = Member.all.push(@member)
    end
  end

  def import_posts_large_cycles
    contents = File.open('./vendor/data/posts3.dat', 'rb') { |f| f.read }
    contents.split(" ").each do |c| 
      data = c.split("|")
      @member = Member.new(first_name: data[0], last_name: data[1], username: data[2], password: data[3])
      @members = Member.all.push(@member)
    end
  end

end
