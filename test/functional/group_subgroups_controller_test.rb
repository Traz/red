require 'test_helper'

class GroupSubgroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_subgroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_subgroup" do
    assert_difference('GroupSubgroup.count') do
      post :create, :group_subgroup => { }
    end

    assert_redirected_to group_subgroup_path(assigns(:group_subgroup))
  end

  test "should show group_subgroup" do
    get :show, :id => group_subgroups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => group_subgroups(:one).to_param
    assert_response :success
  end

  test "should update group_subgroup" do
    put :update, :id => group_subgroups(:one).to_param, :group_subgroup => { }
    assert_redirected_to group_subgroup_path(assigns(:group_subgroup))
  end

  test "should destroy group_subgroup" do
    assert_difference('GroupSubgroup.count', -1) do
      delete :destroy, :id => group_subgroups(:one).to_param
    end

    assert_redirected_to group_subgroups_path
  end
end
