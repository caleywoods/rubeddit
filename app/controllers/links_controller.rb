class LinksController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @links = Link.find(:all, 
                       :joins => 'LEFT JOIN votes on votes.link_id = links.id',
                       :group => 'links.id, links.url, links.title, links.created_at, links.updated_at, links.user_id',
                       :order => 'SUM(COALESCE(votes.score, 0)) DESC')

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

  def talked_about
    @links = Link.find(:all,
                       :joins => :comments,
                       :group => 'link_id',
                       :order => 'comments.count DESC')
  end

  def upvote
    @link = Link.find(params[:id])
    @user = User.find(current_user.id)
    @vote = @link.votes.create(params[:link])
    @vote.user = @user
    @vote.link = @link
    @vote.score = 1
    
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
    @user = User.find(current_user.id)
    @vote = @link.votes.build(params[:link])
    @vote.user = @user
    @vote.link = @link
    @vote.score = -1
        
    respond_to do |format|
      if @vote.save!
        format.html { redirect_to(links_path, :notice => 'Your vote was added.') }
      else
        format.html { redirect_to(links_path, :notice => 'There was an error, please try again later.') }
      end
      
    end

  end

  end
