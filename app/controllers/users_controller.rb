class UsersController < ApplicationController
    def create
        api_key = ENV["STEAM_API_KEY"]
        user = User.new(user_params)
        url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{api_key}&steamids=#{params[:steam_id]}"
        response = RestClient.get(url)
        steam_info = JSON.parse(response)
        if steam_info['response']['players'].length > 0
            user.username = steam_info['response']['players'][0]['personaname']
            user.avatar = steam_info['response']['players'][0]['avatarfull']
            if user.valid?
                user.save
                render json: { user: user.to_json(except: [:created_at, :updated_at, :password_digest]) }, status: :created
            else
                render json: { error: 'failed to create user' }, status: :not_acceptable
            end
        else
            render json: { error: 'steam id not found' }, status: :not_acceptable
        end
    end 

    def show
        user = User.find(params[:id])
        render json: user.to_json(except: [:created_at, :updated_at, :password_digest], include: [:rounds], methods: ['handicap', 'best_round', 'best_course'])
    end

    def rounds
        user = User.find(params[:id])
        last_twenty = user.last_twenty
        render json: last_twenty.to_json(include: [:user, :course, :match], methods: ['score'])
    end

    private

    def user_params
      params.permit(:email, :password, :password_confirmation, :steam_id)
    end
end
