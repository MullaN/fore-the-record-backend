class UsersController < ApplicationController
    before_action :authorized, only: [:profile, :friends, :update]

    def create
        if User.find_by(steam_id: user_params[:steam_id])
            user = User.find_by(steam_id: user_params[:steam_id])
            api_key = ENV["STEAM_API_KEY"]
            url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{api_key}&steamids=#{user_params[:steam_id]}"
            response = RestClient.get(url)
            steam_info = JSON.parse(response)
            if steam_info['response']['players'].length > 0 && (user.username != steam_info['response']['players'][0]['personaname'] || user.avatar != steam_info['response']['players'][0]['avatarfull'])
                user.username = steam_info['response']['players'][0]['personaname']
                user.avatar = steam_info['response']['players'][0]['avatarfull']
                user.save
            end
            token = encode_token(user_id: user.id)
            render json: { user: user.to_json(except: [:created_at, :updated_at]), jwt: token }, status: :created
        else
            api_key = ENV["STEAM_API_KEY"]
            user = User.new(steam_id: user_params[:steam_id].to_i)
            url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{api_key}&steamids=#{user_params[:steam_id]}"
            response = RestClient.get(url)
            steam_info = JSON.parse(response)
            if steam_info['response']['players'].length > 0
                user.username = steam_info['response']['players'][0]['personaname']
                user.avatar = steam_info['response']['players'][0]['avatarfull']
                if user.valid?
                    user.save
                    token = encode_token(user_id: user.id)
                    render json: { user: user.to_json(except: [:created_at, :updated_at]), jwt: token }, status: :created
                else
                    render json: { error: 'failed to create user' }, status: :not_acceptable
                end
            else
                render json: { error: 'steam id not found' }, status: :not_acceptable
            end
        end
    end
    
    def profile
        render json: current_user.to_json(except: [:created_at, :updated_at])
    end

    def show
        user = User.find(params[:id])
        render json: user.to_json(except: [:created_at, :updated_at], include: [:rounds], methods: ['handicap', 'best_round', 'best_course'])
    end

    def rounds
        user = User.find(params[:id])
        last_twenty = user.last_twenty
        error = {error: 'No rounds played'}
        if last_twenty.length > 0
            render json: last_twenty.to_json(include: [:user, :course, :match], methods: ['score'])
        else
            render json: error
        end
    end

    def friends
        api_key = ENV["STEAM_API_KEY"]
        url = "http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=#{api_key}&steamid=#{User.find(params[:id])[:steam_id].to_s}&relationship=friend"
        response = nil
        begin
            response = RestClient.get(url)
        rescue RestClient::ExceptionWithResponse => e
            e.response
        end
        if response
            friends = JSON.parse(response)
            friends = friends['friendslist']['friends']
            friends = friends.select {|friend| User.find_by(steam_id: friend['steamid'].to_i)}
            friends = friends.map {|friend| User.find_by(steam_id: friend['steamid'].to_i)}
            render json: friends
        else
            render json: {error: 'private profile'}
        end
    end

    private

    def user_params
      params.require(:user).permit(:steam_id)
    end
end
