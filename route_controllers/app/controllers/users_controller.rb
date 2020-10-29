class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show 
        user = User.find_by(id: params[:id])
        render json: user
    end

    def create
      user = User.new(user_params)

      if user.save
            render json: user# redirect_to user_url(user)
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        user = User.find_by(id: params[:id])

        if user.update(user_params)
            render json: user#redirect_to user_url(user)
        else
            render json: user.erros.full_messages, status: 422
        end
    end

    def destroy
        user = User.find_by(id:params[:id])
        user.destroy
        # redirect_to user_url(user)
        render json: User.all
    end

    def user_params
        params.require(:user).permit(:name,:email)
    end

end