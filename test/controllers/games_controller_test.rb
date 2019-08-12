require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get pages" do
    get games_pages_url
    assert_response :success
  end

  test "should get setting" do
    get games_setting_url
    assert_response :success
  end

  test "should get score" do
    get games_score_url
    assert_response :success
  end

end
