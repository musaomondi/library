class BooksController < ApplicationController
  before_action :logged_in_user, only: [:show, :index] 
  before_action :admin, only:  [:create, :new, :edit, :update, :destroy]
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book successfully added!"
      redirect_to books_path
    else
      render 'new'
    end
  end
  def index
    @books = Book.all
  end
  def show
    @book = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render 'edit'
    end
  end
  def destroy
    @book=Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end
  def borrow
    @book = Book.find_by(title: params[:title])
    if @book == nil
      flash[:notice] = 'This book is not in the library.'
    elsif @book.available == 0
      flash[:notice]= 'This book is unavailable.'
    else
      @book.available = 1
      @book.save
      @books_loaned = BooksOnLoan.create(book_id: @book.id, user_id: @user.id)
      @books_loaned.save
      flash[:success] = 'The book was checked out.'
    end
  end
  def return
  end
  private
  def book_params
    params.require(:book).permit(:category, :title, :author, :isbn, :available)
  end
  def admin
    redirect_to(books_path) unless current_user.admin?
  end
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "You can't access this."
      redirect_to login_path
    end
  end
end

