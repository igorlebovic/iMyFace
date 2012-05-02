class MembersController < ApplicationController

  def index
    require 'will_paginate/array'
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
  
end