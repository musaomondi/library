class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book successfully added!"
  
    else
      render 'new'
    end
  end
  def index
  end
  def show
  end

  private
  def book_params
    params.require(:book).permit(:category, :title, :author, :year_published)
  end
end

