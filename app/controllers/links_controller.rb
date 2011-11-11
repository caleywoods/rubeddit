class LinksController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @links = Link.all
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
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
        format.html { redirect_to links_index_url, :flash => { :success => "Succesfully added #{@link.title}!" } }
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
    @links = Link.find(:all)
    render :action => 'index'
  end

  def vote_up
    @user = current_user
    @link = Link.find(params[:id])

    if @user.voted_for?(@link)
      redirect_to links_index_url, :flash => { :notice => "You done did that." }
    else
      @user.vote_exclusively_for(@link)
      redirect_to links_index_url, :flash => { :success => "Voted that bitch up." }
    end
  end

  def vote_down
    @user = current_user
    @link = Link.find(params[:id])

    if @user.voted_for?(@link)
      @user.vote_exclusively_against(@link)
      redirect_to links_index_url, :flash => { :success => "Down with the man." }
    else
      redirect_to links_index_url, :flash => { :notice => "You done did that." }
    end
  end

end
