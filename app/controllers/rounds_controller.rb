class RoundsController < ApplicationController
    def index
        rounds = Round.all
        rounds = rounds.sort_by {|round| round.score.to_i}
        render json: rounds.to_json(except: [:updated_at], include:[:user, :course, :match], methods: ['score'])
    end

    def num_rounds
        rounds = Round.all
        rounds = rounds.sort_by {|round| round.score.to_i}[0..params[:num].to_i]
        if rounds.length > 0
            render json: rounds.to_json(except: [:updated_at], include:[:user, :course, :match], methods: ['score'])
        else
            render json: {error: 'No rounds played'}
        end
    end

    def top_ten_for_course
        rounds = Round.all
        rounds = rounds.select {|round| round.course.id == params[:cid].to_i}
        rounds = rounds.sort_by {|round| round.score.to_i}[0..10]
        if rounds.length > 0
            render json: rounds.to_json(except: [:updated_at], include:[:user, :course, :match], methods: ['score'])
        else
            render json: {error: 'No rounds played'}
        end
    end
end
