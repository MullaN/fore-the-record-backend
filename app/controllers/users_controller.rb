class UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        render json: user.to_json(except: [:created_at, :updated_at, :password_digest], include: [:rounds], methods: ['handicap', 'best_round', 'best_course'])
    end
end
