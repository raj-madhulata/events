class EventsController < ApplicationController
  # before_action :require_clerk_session!
  # before_action :authenticate_clerk_user!, only: [:vote, :upvote, :downvote]
  # skip_before_action :require_clerk_session!, only: [:index]
  def index
    @events = Event.all
  end

  private

  # def require_clerk_session!
  #   redirect_to clerk.sign_in_url unless clerk.session
  # end

end
