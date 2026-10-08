class VotesController < ApplicationController
  before_action :set_event, only: [:upvote, :downvote]
  def upvote
    command = Voting::Commands::VoteOnEvent.new(
      event_id: params[:id],
      user_id: 1, # Replace with actual user ID from session or authentication system
      value: 1
    )
    CommandBus.new.call(command)
    redirect_to events_path, notice: "Upvoted successfully"
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def downvote
    command = Voting::Commands::VoteOnEvent.new(
      event_id: params[:id],
      user_id: 1, # Replace with actual user ID from session or authentication system
      value: -1
    )
    CommandBus.new.call(command)
    redirect_to events_path, notice: "Downvoted successfully"
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
