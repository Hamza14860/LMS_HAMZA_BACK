# lib/api/v1/books.rb
module API
  module V1
    class Books < Grape::API
      version 'v1'
      format :json

      resource :books do
        # index endpoint to get all books
        desc "Return list of all Books"
        get :rabl => "books/index.rabl" do
          @books = Book.all
        end

        # Show endpoint to a specific Book
        desc "Return a specific book"
        get ':id', :rabl => "books/show.rabl"  do
          @book = Book.find_by_id(params[:id])
        end
      end
    end
  end
end
