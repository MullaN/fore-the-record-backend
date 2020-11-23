class UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        render json: user.to_json(except: [:created_at, :updated_at, :password_digest], include: [:rounds], methods: ['handicap', 'best_round', 'best_course'])
    end

    def rounds
        user = User.find(params[:id])
        last_twenty = user.last_twenty
        render json: last_twenty.to_json(include: [:user, :course, :match], methods: ['score'])
    end
end
