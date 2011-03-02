class LinksController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show] 

  def index
    @links = Link.all
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @links }
      format.json { render :json => @links }
    end
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
    @link.user = current_user

    respond_to do |format|
      if @link.save!
        format.html { redirect_to(links_index_url, :notice => 'Link was successfully added.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def latest
    @links = Link.latest

    render :template => 'index'
  end
end
