class SessionsController < ApplicationController
    # to handle user login sessions
    def create
        # Find a user in the database using the username from params
        user = User.find_by(username: params[:username])

        # save the user's Id in the session hash
        session[:user_id] = user.id

        # return the user as a json object
        if user
            render json: user
        else
            render json: { error: "user not found" }, status: :not_found
        end
    end

    # to handle user logout
    def destroy
        # remove the user ID from the session hash
        session.delete(:user_id)
        # return an empty response with a 204 content status code
        head :no_content
    end

end
