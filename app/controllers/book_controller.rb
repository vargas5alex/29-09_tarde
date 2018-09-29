class BookController < ApplicationController
    def index
    # Hacemos una consulta a todos los libros
    @books = Book.all
    end
    def new
    end
    
    def create
        book_params = params.require(:book).permit(:title, :description)
        Book.create(book_params)
        redirect_to action: 'index'
    end
    def show
        @book = Book.find(params[:id])
        if @book.nil?
            redirect_to action: 'index'
        end
    end

    def delete
        @book = Book.find(params[:id])
        unless @book.nil?
            @book.delete
        end
        redirect_to action: 'index'
    end
end


