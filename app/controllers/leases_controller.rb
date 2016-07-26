class LeasesController < ApplicationController
  # before_action :admin_user, only: [:destroy, :index]
  def index
    @requests = Lease.requested
    @accepts = Lease.borrowed
  end
  def new
    @lease = Lease.new
  end
  def show
    @user=User.find(params[:id])
    @accepts = @user.leases.borrowed
  end
  def create
    @lease = Lease.new(lease_params)
    begin
      if @lease.save
        flash[:success] = "Request for #{@lease.book.title} was successful."
        redirect_to books_path
      else
        flash[:danger] = "Error in borrowing this book"
        redirect_to books_path
      end
    rescue
      flash[:info] ="You can't borrow same book twice"
      redirect_to books_path
    end
  end
  def accept
    @lease = Lease.find(params[:lease_id])
    book = Book.find(@lease.book_id)
    book.accept.save
    @lease.update_attribute(:status, params[:status])
    @user = User.find_by(id: @lease.user_id)
    @user.send_acceptance_email
    flash[:success] = "You've accepted request for #{@lease.book.title} "
    redirect_to leases_path
  end
  def destroy
      @lease = Lease.find(params[:id]).destroy
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
