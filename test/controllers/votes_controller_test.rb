require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest
  test "upvoting an event persists the vote and updates its count" do
    event = events(:one)

    assert_difference -> { event.event_vote_count.reload.upvotes }, 1 do
      post upvote_event_path(event)
    end

    assert_response :success
    assert_equal({ "status" => "ok" }, response.parsed_body)
  end
end
