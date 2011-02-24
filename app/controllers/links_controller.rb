class LinksController < ApplicationController

  before_filter :authenticate_user!, :except => :index 

  def index
    @links = Link.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def latest
    @links = Link.latest
  end

  def show
    @link = Link.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @link = Link.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to(@link, :notice => 'Link was successfully added.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
