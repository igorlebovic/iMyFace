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
    @members = Member.all.push(@member)
    redirect_to members_path
  end
  
  def inmyface
    @member = Member.find(params[:id])
    unless Member.find(params[:face])
      @face = Member.new(first_name: params[:face], last_name: params[:face], username: params[:face], password: params[:face], outta: [], into: [])
      @members = Member.all.push(@face)
    end
    @member.into.unshift(params[:face])
    redirect_to @member
  end
  
  def outtamyface
    @member = Member.find(params[:id])
    unless Member.find(params[:face])
      @face = Member.new(first_name: params[:face], last_name: params[:face], username: params[:face], password: params[:face], outta: [], into: [])
      @members = Member.all.push(@face)
    end
    @member.outta.unshift(params[:face])
    redirect_to @member
  end
  
end