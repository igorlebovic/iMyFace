class MembersController < ApplicationController

  def index
    @members = Member.all.paginate(:page => params[:page])
  end

  def show
    begin @member = Member.find(params[:id])
    rescue
      render 'members/error'
    end
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], password: params[:password], outta: [params[:outta]], into: [params[:into]])
    @members = Member.all.unshift(@member)
    redirect_to members_path
  end
  
  def import_data
    import_faces
    import_connections
    redirect_to root_path
  end
  
  def outtamyface
    @member = Member.find(params[:id])
    @face = Member.find(params[:face])
    # raise @face.inspect
    raise @member.hash_outta.inspect
    if 1 == 2
            raise @member.inspect
      @result = "#{@face.username} is one of #{@member.username}'s Outta connections"
      redirect_to 'facedup' and return
    else
      @result = "no match"
      redirect_to 'facedup' and return
    end
    if @face
      raise @face.inspect
      if hash_outta(@member).has_key?(@face)
        @result = "#{@face.username} is one of #{@member.username}'s Outta connections"
        redirect_to 'facedup' and return
      else
        @result = "#{@face.username} is not one of #{@member.username}'s Outta connections"
        redirect_to 'facedup' and return
      end
    else
      # @face = Member.new(first_name: params[:face], last_name: params[:face], username: params[:face], password: params[:face], outta: [], into: [])
      # Member.all.push(@face)
      # @member.outta.unshift(params[:face])
      @result = "#{@face.username} is not a member"
      redirect_to 'facedup' and return
    end
  end
  
  def facedup
    @result = "test"
  end

  def inmyface
    @member = Member.find(params[:id])
    if @member.into.include?(params[:face])
    else
      begin Member.find(params[:face])
      rescue
        @face = Member.new(first_name: params[:face], last_name: params[:face], username: params[:face], password: params[:face], outta: [], into: [])
        @members = Member.all.push(@face)
      end
      @member.into.unshift(params[:face])
    end
    redirect_to member_path(@member.username)
  end
    
end