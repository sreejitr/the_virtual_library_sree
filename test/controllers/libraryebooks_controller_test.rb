require 'test_helper'

class LibraryebooksControllerTest < ActionController::TestCase
  setup do
    @libraryebook = libraryebooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:libraryebooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create libraryebook" do
    assert_difference('Libraryebook.count') do
      post :create, libraryebook: { abstract: @libraryebook.abstract, author: @libraryebook.author, genre: @libraryebook.genre, loanamount: @libraryebook.loanamount, name: @libraryebook.name }
    end

    assert_redirected_to libraryebook_path(assigns(:libraryebook))
  end

  test "should show libraryebook" do
    get :show, id: @libraryebook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @libraryebook
    assert_response :success
  end

  test "should update libraryebook" do
    patch :update, id: @libraryebook, libraryebook: { abstract: @libraryebook.abstract, author: @libraryebook.author, genre: @libraryebook.genre, loanamount: @libraryebook.loanamount, name: @libraryebook.name }
    assert_redirected_to libraryebook_path(assigns(:libraryebook))
  end

  test "should destroy libraryebook" do
    assert_difference('Libraryebook.count', -1) do
      delete :destroy, id: @libraryebook
    end

    assert_redirected_to libraryebooks_path
  end
end
