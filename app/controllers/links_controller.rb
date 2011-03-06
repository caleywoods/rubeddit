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
    @user = current_user

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

    render :action => 'index'
  end

  def upvote
    @link = Link.find(params[:id])
    @user = User.find(current_user.id)
    @vote = @link.votes.create(params[:link])
    @vote.link = @link
    @vote.user = @user
    
    respond_to do |format|
      if @vote.save!
        format.html { redirect_to(links_path, :notice => 'Your vote was added.') }
      else
        format.html { redirect_to(links_path, :notice => 'There was an error, please try again later.') }
      end
      
    end
  end

  def downvote
    @link = Link.find(params[:id])
    @vote.user = current_user
    @vote = @link.votes.create(params[:link])
    @vote.link = @link

  end

  end
