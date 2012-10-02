require 'test_helper'

class PLangRequirementsControllerTest < ActionController::TestCase
  setup do
    @p_lang_requirement = p_lang_requirements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:p_lang_requirements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create p_lang_requirement" do
    assert_difference('PLangRequirement.count') do
      post :create, p_lang_requirement: { authority: @p_lang_requirement.authority, defined: @p_lang_requirement.defined, gist: @p_lang_requirement.gist, meter: @p_lang_requirement.meter, must: @p_lang_requirement.must, past: @p_lang_requirement.past, plan: @p_lang_requirement.plan, record: @p_lang_requirement.record, scale: @p_lang_requirement.scale, stakeholder: @p_lang_requirement.stakeholder, stretch: @p_lang_requirement.stretch, tag: @p_lang_requirement.tag, trend: @p_lang_requirement.trend, wish: @p_lang_requirement.wish }
    end

    assert_redirected_to p_lang_requirement_path(assigns(:p_lang_requirement))
  end

  test "should show p_lang_requirement" do
    get :show, id: @p_lang_requirement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @p_lang_requirement
    assert_response :success
  end

  test "should update p_lang_requirement" do
    put :update, id: @p_lang_requirement, p_lang_requirement: { authority: @p_lang_requirement.authority, defined: @p_lang_requirement.defined, gist: @p_lang_requirement.gist, meter: @p_lang_requirement.meter, must: @p_lang_requirement.must, past: @p_lang_requirement.past, plan: @p_lang_requirement.plan, record: @p_lang_requirement.record, scale: @p_lang_requirement.scale, stakeholder: @p_lang_requirement.stakeholder, stretch: @p_lang_requirement.stretch, tag: @p_lang_requirement.tag, trend: @p_lang_requirement.trend, wish: @p_lang_requirement.wish }
    assert_redirected_to p_lang_requirement_path(assigns(:p_lang_requirement))
  end

  test "should destroy p_lang_requirement" do
    assert_difference('PLangRequirement.count', -1) do
      delete :destroy, id: @p_lang_requirement
    end

    assert_redirected_to p_lang_requirements_path
  end
end
