class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end
end
