require 'test_helper'

class StaticPagesSearchTest < ActionDispatch::IntegrationTest
  test "should search room" do
    get root_path
    assert_select ".home-search"

    get search_path, params: {search: "San Francisco"}
    assert_template "static_pages/search"
    assert_select ".photo-card", count: 1

    get search_path, params: {search: ""}
    assert_template "static_pages/search"
    assert_select ".photo-card", count: 3
  end

  test "should not shows room when date matches the reservation date" do
    # reservation 08-10-2018 - 15-10-2018
    get search_path, params: {search: "San Francisco", start_date: "11-10-2018", end_date: "20-10-2018"}
    assert_template "static_pages/search"
    assert_select ".photo-card", count: 0

    get search_path, params: {search: "San Francisco", start_date: "05-10-2018", end_date: "20-10-2018"}
    assert_template "static_pages/search"
    assert_select ".photo-card", count: 0
  end
end
