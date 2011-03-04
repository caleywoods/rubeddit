class CommentsController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.create(params[:comment])

    respond_to do |format|
      if @comment.save!
        format.html { redirect_to(link_path(@link), :notice => 'Comment was successfully added.') }
      else
        format.html { render :action => 'new' }
      end
    end
  end
end
