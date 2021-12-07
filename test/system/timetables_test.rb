require "application_system_test_case"

class TimetablesTest < ApplicationSystemTestCase
  setup do
    @timetable = timetables(:one)
  end

  test "visiting the index" do
    visit timetables_url
    assert_selector "h1", text: "Timetables"
  end

  test "creating a Timetable" do
    visit timetables_url
    click_on "New Timetable"

    fill_in "Datetime start", with: @timetable.datetime_start
    fill_in "Datetimestop", with: @timetable.datetimestop
    fill_in "Movie", with: @timetable.movie_id
    fill_in "Theater", with: @timetable.theater_id
    click_on "Create Timetable"

    assert_text "Timetable was successfully created"
    click_on "Back"
  end

  test "updating a Timetable" do
    visit timetables_url
    click_on "Edit", match: :first

    fill_in "Datetime start", with: @timetable.datetime_start
    fill_in "Datetimestop", with: @timetable.datetimestop
    fill_in "Movie", with: @timetable.movie_id
    fill_in "Theater", with: @timetable.theater_id
    click_on "Update Timetable"

    assert_text "Timetable was successfully updated"
    click_on "Back"
  end

  test "destroying a Timetable" do
    visit timetables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Timetable was successfully destroyed"
  end
end
