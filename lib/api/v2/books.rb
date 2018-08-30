# lib/api/v1/books.rb
module API
  module V2
    class Books < Grape::API
      version 'v2'
      format :json

      resource :books do

        desc "Return list of all Books"
        get do
          Book.all
        end

        get ':id' do
          Book.find_by_id(params[:id])
        end

        params do
          requires :name, type:       :string
          requires :isbn, type:       :integer
          requires :edition, type:       :string
          requires :author, type:      :string
          requires :publisher, type:      :string
          requires :copies, type:       :integer
          requires :price, type:       :integer
          requires :description, type:       :text
        end
        post do
          @book = Book.new(
            name: params[:name]
            isbn: params[:isbn]
            edition: params[:edition]
            author: params[:author]
            publisher: params[:publisher]
            copies: params[:copies]
            price: params[:price]
            description: params[:description]
          )

          if @book.save
            @book
            status 200
          else
            status 400
          end
        end

        delete ':id' do
          Book.find_by_id(params[:id]).destroy
        end

      end
    end
  end
end
