require 'test_helper'

class BooksOnLoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @books_on_loan = books_on_loans(:one)
  end

  test "should get index" do
    get books_on_loans_url
    assert_response :success
  end

  test "should get new" do
    get new_books_on_loan_url
    assert_response :success
  end

  test "should create books_on_loan" do
    assert_difference('BooksOnLoan.count') do
      post books_on_loans_url, params: { books_on_loan: { book_id: @books_on_loan.book_id, user_id: @books_on_loan.user_id } }
    end

    assert_redirected_to books_on_loan_url(BooksOnLoan.last)
  end

  test "should show books_on_loan" do
    get books_on_loan_url(@books_on_loan)
    assert_response :success
  end

  test "should get edit" do
    get edit_books_on_loan_url(@books_on_loan)
    assert_response :success
  end

  test "should update books_on_loan" do
    patch books_on_loan_url(@books_on_loan), params: { books_on_loan: { book_id: @books_on_loan.book_id, user_id: @books_on_loan.user_id } }
    assert_redirected_to books_on_loan_url(@books_on_loan)
  end

  test "should destroy books_on_loan" do
    assert_difference('BooksOnLoan.count', -1) do
      delete books_on_loan_url(@books_on_loan)
    end

    assert_redirected_to books_on_loans_url
  end
end
