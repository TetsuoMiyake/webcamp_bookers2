class BooksController < ApplicationController

  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @book_detail = Book.find(params[:id])
    @user = @book_detail.user
  end

  def edit
    @book_detail = Book.find(params[:id])
  end

  def update
    @book_detail = Book.find(params[:id])
    if @book_detail.update(book_params)
      redirect_to book_path(@book_detail.id)
    else
      render :edit
    end
  end

  def destroy
    @book_detail = Book.find(params[:id])
    @book_detail.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
