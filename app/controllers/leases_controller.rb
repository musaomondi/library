class LeasesController < ApplicationController
  def index
    @requests = Lease.requested
    @accepts = Lease.borrowed
  end
  def new
    @lease = Lease.new
  end
  def create
    @lease = Lease.new(lease_params)
    if @lease.save
      flash[:success] = "Request for #{@lease.book.title} was successful."
      redirect_to books_path
    end
  end
  def accept
    @lease = Lease.find(params[:book_id])
    @lease.update_attribute(:status, params[:status])
    flash[:success] = "You've accepted request for #{@lease.book.title} "
    redirect_to leases_path
  end
  def destroy
    @lease = Lease.find(params[:id])
    book = Book.find(@lease.book_id)
    book.return.save
    flash[:success]="Book returned"
    redirect_to leases_path
  end
  private
  def lease_params
    params.require(:lease).permit(:book_id, :user_id) 
  end
end
