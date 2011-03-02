class VoteablesController < ApplicationController

    def create
    @voteable = Voteable.new(params[:voteable])
    @voteable.user = current_user
    
    respond_to do |format|
      if @voteable.save
        flash[:notice] = 'Voteable was successfully saved.'
        format.html { redirect_to([@user, @voteable]) }
        format.xml  { render :xml => @voteable, :status => :created, :location => @voteable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @voteable.errors, :status => :unprocessable_entity }
      end
    end
  end
end
