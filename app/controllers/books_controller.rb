class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book successfully added!"
      redirect_to @book 
    else
      render 'new'
    end
  end
  def index
    @books = Book.all
  end
  def show
  end

  private
  def book_params
    params.require(:book).permit(:category, :title, :edition, :author, :year_published)
  end
end

