require 'test_helper'

class CodeListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @code_list = code_lists(:one)
  end

  test "should get index" do
    get code_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_code_list_url
    assert_response :success
  end

  test "should create code_list" do
    assert_difference('CodeList.count') do
      post code_lists_url, params: { code_list: { code_system: @code_list.code_system, count: @code_list.count, description: @code_list.description, name: @code_list.name } }
    end

    assert_redirected_to code_list_url(CodeList.last)
  end

  test "should show code_list" do
    get code_list_url(@code_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_code_list_url(@code_list)
    assert_response :success
  end

  test "should update code_list" do
    patch code_list_url(@code_list), params: { code_list: { code_system: @code_list.code_system, count: @code_list.count, description: @code_list.description, name: @code_list.name } }
    assert_redirected_to code_list_url(@code_list)
  end

  test "should destroy code_list" do
    assert_difference('CodeList.count', -1) do
      delete code_list_url(@code_list)
    end

    assert_redirected_to code_lists_url
  end
end
