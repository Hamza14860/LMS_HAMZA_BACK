# lib/api/v1/issues.rb
module API
  module V1
    class Issues < Grape::API
      version 'v1'
      format :json
      formatter :json, Grape::Formatter::Rabl

      resource :issues do

        # list a particular order
        desc "list a particular issue"
        get ':id', :rabl => "issues/show.rabl" do
          @issue = Issue.find_by_id(params[:id])
          error!({ error: 'Issue not found' }, 404) if @issue.nil?
        end

        # list all issues of a member
        desc "list all issues of a member"
        params do
          requires :member_id,    type: Integer, desc: 'Member ID'
        end
        get :rabl => "issues/index.rabl" do
          member = Member.find_by_id(params[:member_id])
          error!({ error: 'Member not found' }, 404) if member.nil?

          @issues = member.issues

        end

        # creates an issue in system
        desc "creates an issue in system"
        params do
          requires :member_id,    type: Integer, desc: 'Member ID'
          #optional :comments, type: String, desc: 'Member comments'
          requires :book_id, type: Integer, desc: 'Book ID'

          optional :issue_date, type: Date, desc: 'Issue Date'

          #group :order_items_attributes, type: Array do
          #  requires :item_id,     type: Integer
          #  requires :quantity,    type: Integer
          #end
        end
        post :rabl => "issues/show.rabl" do
          issue = Issue.new(
            member_id: params[:member_id],
            #comments: params[:comments],
            book_id: params[:book_id]


            #order_items_attributes: params[:order_items_attributes]
          )

          if issue.save
            status 201
            @issue #= Issue.includes(:order_items).where(:id => issue.id).first
          else
            error!({ error: 'Invalid params', details: "#{issue.errors.full_messages.join(' ,')}" }, 400)
          end
        end
      end
    end
  end
end
