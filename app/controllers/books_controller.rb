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
    @books = Book.where("available > 0")
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
    # debugger
    @book = Book.find_by(id: params[:id])
    @books_loaned = BooksOnLoan.create(id: @book.id)
    @books_loaned.save
    flash[:success] = "Request for #{@book.title} was successful."
    redirect_to books_path
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

