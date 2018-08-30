# lib/api/v1/members.rb
module API
  module V1
    class Members < Grape::API
      version 'v1'
      format :json

      resource :members do

        # index endpoint to get all members
        desc "Return list of all members"
        get :rabl => "members/index.rabl" do
          @members = Member.all
        end

        # login a member into system
        desc "SignIn a member in system"
        params do
          requires :email,    type: String, desc: 'Member email'
          requires :password, type: String, desc: 'Member Password'
        end
        post '/signin' do
          @member = Member.find_by_email(params[:email])
          error!({ error: 'Member Does Not Exist! Please signup to continue!'}, 400) if @member.nil?

          if @member.password == params[:password]
            status 200
            @member
          else
            error!({ error: 'Incorrect Password, Please try again'}, 400)
          end
        end

        # Add a new member in system
        desc "Sign Up a new member in system"
        params do
          requires :roll_no, type: String, desc: 'Member Roll No'
          requires :first_name, type: String, desc: 'Member first name'
          requires :last_name,  type: String, desc: 'Member last name'
          requires :program,    type: String, desc: 'Member program'
          requires :email,      type: String, desc: 'Member email'
          requires :password,   type: String, desc: 'Member Password'
        end
        post '/signup' do
          @member = Member.new(
            roll_no: params[:roll_no],
            first_name: params[:first_name],
            last_name:  params[:last_name],
            program: params[:program],
            email:      params[:email],
            password:   params[:password],
)

          if @member.save
            status 201
            @member
          else
            error!({ error: 'Invalid params', details: "#{@member.errors.full_messages.join(' ,')}" }, 400)
          end
        end
      end
    end
  end
end
