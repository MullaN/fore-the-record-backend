class RoundsController < ApplicationController
    def index
        rounds = Round.all
        rounds = rounds.sort_by {|round| round.score.to_i}
        render json: rounds.to_json(except: [:updated_at], include:[:user, :course, :match], methods: ['score'])
    end
end
