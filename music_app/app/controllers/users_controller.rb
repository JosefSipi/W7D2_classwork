class UsersController < ApplicationController



    def new
        @user = User.new
        render :new
    end

    def create
        user = User.new(user_params)
        if user.save
            login!(user)
            redirect_to user_url(user)
        else
            flash[:errors] = "Invalid username or password"
            redirect_to new_user
        end
    end

    def show
        user = User.find_by(session_toke: user_params[:session_toke])
        render :show
    end

    def user_params
        params.require(:user).permit(:email, :password, :session_token)
    end

end
