class MembersController < ApplicationController

  include Hashing

  def index
    @members = Member.all.paginate(:page => params[:page])
  end

  def show
    if @member = Member.find(params[:id])
    else
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
    @member = params[:id]
    @face = params[:face]
    if Member.find(@face)
      if set_outta(@member).include?(@face)
        @result = "#{@face} is one of #{@member}'s Outta connections"
        render :action => "facedup"
      else
        @result = "#{@face} is not one of #{@member}'s Outta connections"
        render :action => "facedup"
      end
    else
      @result = "#{@face} is not a member"
      render :action => "facedup"
    end
  end
  
  def facedup
    @result = "test"
  end

  def inmyface
    @member = params[:id]
    @face = params[:face]
    if Member.find(@face)
      if set_into(@member).include?(@face)
        @result = "#{@face} is one of #{@member}'s Into connections"
        render :action => "facedup"
      else
        @result = "#{@face} is not one of #{@member}'s Into connections"
        render :action => "facedup"
      end
    else
      @result = "#{@face} is not a member"
      render :action => "facedup"
    end
  end
    
end