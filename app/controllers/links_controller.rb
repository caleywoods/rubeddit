class LinksController < ApplicationController

  before_filter :authenticate_user!, :except => :index 

  def index
    @links = Link.all

    respond_to do |format|
      format.html # index.html.erb
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
    @link.user = User.current_user

    respond_to do |format|
      if @link.save
        format.html { redirect_to(links_index_url, :notice => 'Link was successfully added.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
