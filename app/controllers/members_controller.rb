class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(params[:member])
    if @member.valid?
      flash[:notice] = "Successfully created member."
      redirect_to @category
    else
      render :action => 'new'
    end
  end
  
end