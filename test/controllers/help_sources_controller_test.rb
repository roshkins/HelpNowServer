require 'test_helper'

class HelpSourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @help_source = help_sources(:one)
  end

  test "should get index" do
    get help_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_help_source_url
    assert_response :success
  end

  test "should create help_source" do
    assert_difference('HelpSource.count') do
      post help_sources_url, params: { help_source: { description: @help_source.description, help_name: @help_source.help_name, help_phone: @help_source.help_phone } }
    end

    assert_redirected_to help_source_url(HelpSource.last)
  end

  test "should show help_source" do
    get help_source_url(@help_source)
    assert_response :success
  end

  test "should get edit" do
    get edit_help_source_url(@help_source)
    assert_response :success
  end

  test "should update help_source" do
    patch help_source_url(@help_source), params: { help_source: { description: @help_source.description, help_name: @help_source.help_name, help_phone: @help_source.help_phone } }
    assert_redirected_to help_source_url(@help_source)
  end

  test "should destroy help_source" do
    assert_difference('HelpSource.count', -1) do
      delete help_source_url(@help_source)
    end

    assert_redirected_to help_sources_url
  end
end
