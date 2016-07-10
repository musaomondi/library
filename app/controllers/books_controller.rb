class BooksController < ApplicationController
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
  end
  def edit
    @book=Book.find_by(params[:id])
  end
  def update
    @book =Book.find(params[:id])

    if @book.update(book_params)
      redirect_to books_path
    else
      render 'edit'
    end
  end
  def destroy
    @book=Book.find_by(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:category, :title, :edition, :author, :year_published)
  end
end

