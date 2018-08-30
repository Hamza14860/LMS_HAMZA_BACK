# lib/api/v1/root.rb
module API
  module V1
    class Root < Grape::API
      mount API::V1::Books
      mount API::V1::Members
      mount API::V1::Issues
    end
  end
end
