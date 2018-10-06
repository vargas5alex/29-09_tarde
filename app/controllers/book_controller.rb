class BookController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :delete]
    def index
    # Hacemos una consulta a todos los libros
    @books = Book.all
    end
    def new
        @authors = Author.all
        
        # Author.find()
        # Author.find_by(name: 'SGR')
        # Author.where ()

    end
    def create
        book_params = params.require(:book).permit(:title, :description, :author_id)
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


