class MembersController < ApplicationController

  def index
    @members = Member.all.paginate(:page => params[:page])
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], password: params[:password], outta: [], into: [])
    @members = Member.all.unshift(@member)
    redirect_to members_path
  end
  
  def outtamyface
    @member = Member.find(params[:id])
    if @member.outta.include?(params[:face])
    else
      begin Member.find(params[:face])
      rescue
        @face = Member.new(first_name: params[:face], last_name: params[:face], username: params[:face], password: params[:face], outta: [], into: [])
        @members = Member.all.push(@face)
      end
      @member.outta.unshift(params[:face])
    end
    redirect_to member_path(@member.username)
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