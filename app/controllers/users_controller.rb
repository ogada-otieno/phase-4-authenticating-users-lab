class UsersController < ApplicationController
    # handle user persistence in the frontend such as when the page refreshes
    def show
        # find a user in the database using the user id from the session hash
        user = User.find_by(id: session[:user_id])
        # return the user as a json object or return error
        if user
            render json: user
        else
            render json: { error: "Not authorized"}, status: :unauthorized
        end
    end

end
