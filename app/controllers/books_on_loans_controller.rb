class BooksOnLoansController < ApplicationController
  before_action :set_books_on_loan, only: [:show, :edit, :update, :destroy]

  # GET /books_on_loans
  # GET /books_on_loans.json
  def index
    @books_on_loans = BooksOnLoan.all
  end

  # GET /books_on_loans/1
  # GET /books_on_loans/1.json
  def show
  end

  # GET /books_on_loans/new
  def new
    @books_on_loan = BooksOnLoan.new
  end

  # GET /books_on_loans/1/edit
  def edit
  end

  # POST /books_on_loans
  # POST /books_on_loans.json
  def create
    @books_on_loan = BooksOnLoan.new(books_on_loan_params)

    respond_to do |format|
      if @books_on_loan.save
        format.html { redirect_to @books_on_loan, notice: 'Books on loan was successfully created.' }
        format.json { render :show, status: :created, location: @books_on_loan }
      else
        format.html { render :new }
        format.json { render json: @books_on_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books_on_loans/1
  # PATCH/PUT /books_on_loans/1.json
  def update
    respond_to do |format|
      if @books_on_loan.update(books_on_loan_params)
        format.html { redirect_to @books_on_loan, notice: 'Books on loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @books_on_loan }
      else
        format.html { render :edit }
        format.json { render json: @books_on_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books_on_loans/1
  # DELETE /books_on_loans/1.json
  def destroy
    @books_on_loan.destroy
    respond_to do |format|
      format.html { redirect_to books_on_loans_url, notice: 'Books on loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_books_on_loan
      @books_on_loan = BooksOnLoan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def books_on_loan_params
      params.require(:books_on_loan).permit(:book_id, :user_id)
    end
end
