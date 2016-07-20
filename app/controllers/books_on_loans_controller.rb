class BooksOnLoansController < ApplicationController
  before_action :set_books_on_loan, only: [:show, :edit, :update, :destroy]

  def index
    @books_on_loans = BooksOnLoan.all
  end

  def show
  end

  def new
    @books_on_loan = BooksOnLoan.new
  end

  def edit
  end

  def create
    @books_on_loan = BooksOnLoan.new(books_on_loan_params)
    if @books_on_loan.save
      redirect_to @books_on_loan, notice: 'Books on loan was successfully created.' 
    else
      render :new
    end
  end

  def update
    if @books_on_loan.update(books_on_loan_params)
      redirect_to @books_on_loan
      flash[:notice] = 'Books on loan was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @books_on_loan.destroy
    redirect_to books_on_loans_url
    flash[:notice] = 'Books on loan was successfully destroyed.' 
  end

  private
  def set_books_on_loan
    @books_on_loan = BooksOnLoan.find(params[:id])
  end
  def books_on_loan_params
    params.require(:books_on_loan).permit(:book_id, :user_id)
  end
end
