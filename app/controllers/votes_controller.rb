class VotesController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
  end
end
