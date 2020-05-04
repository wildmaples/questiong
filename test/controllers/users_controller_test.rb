# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @username = "awildmaples"
  end
  test 'should not save user without proper params' do
    user = User.new
    assert_not user.save
  end

  test 'should get #new' do
    get '/users/new'
    assert_response :ok
  end

  test 'should create user with proper params' do
    assert_difference('User.count') do
      post users_url, params: { user:
        {
          username: @username,
          email: 'maple@questiong.com',
          password: 'password_should_be_minimum_9_characters',
        } }
    end

    assert_redirected_to questions_path
    assert_match @username, flash[:notice]
  end

  test 'should not create user without proper params' do
    assert_no_difference('User.count') do
      post users_url, params: { user:
        {
          username: @username,
          email: 'maple@questiong.com',
          password: 'password',
        } }
    end
  end
end
