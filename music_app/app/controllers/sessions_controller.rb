class SessionsController < ApplicationController


    def new
        render :new
    end
   
    def create
        user = User.find_by_credentials(params[:user][:email],params[:user][:password])
        if user
            login!(user)
            redirect_to user_url(user.id)
        else
            redirect_to :new
        end
    end

    def destroy
        logout!
        flash[:success] = "You have successfully logged out!"
        redirect_to new_sessions_url
    end

end