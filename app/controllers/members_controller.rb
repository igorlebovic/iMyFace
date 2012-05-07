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
  
  def remove
    Member.remove
    redirect_to members_path
  end
  
  def import_data_small
    import_faces_small
    import_connections_small
    redirect_to root_path
  end

  def import_data_large
    import_faces_large
    import_connections_large
    redirect_to root_path
  end

  def import_data_large_cycles
    import_faces_large_cycles
    import_connections_large_cycles
    redirect_to root_path
  end
  
  def outtamyface
    @member = params[:id]
    @face = params[:face]
    if Member.find(@face)
      @overlap = overlap_outta(@member, @face)
      @overlap_paginated = @overlap.paginate(:page => params[:page])
      if set_outta(@member).has_key?(@face)
        @result = 1
        @sequence = sequence_outta(@member, @face)
        render :action => "facedup"
      else
        @result = 2
        render :action => "facedup"
      end
    else
      @result = 3
      render :action => "facedup"
    end
  end
  
  def inmyface
    @member = params[:id]
    @face = params[:face]
    if Member.find(@face)
      if set_into(@member).has_key?(@face)
        @result = 4
        @sequence = sequence_outta(@member, @face)
        render :action => "facedup"
      else
        @result = 5
        render :action => "facedup"
      end
    else
      @result = 3
      render :action => "facedup"
    end
  end
    
  def facedup
  end

end