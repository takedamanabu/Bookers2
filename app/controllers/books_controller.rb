class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "successfully"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  def correct_user
    book = Book.find(params[:id])
    if current_user.id != book.user.id
      redirect_to books_path
    end
  end

end
