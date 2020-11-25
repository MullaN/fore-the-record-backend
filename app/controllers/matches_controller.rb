class MatchesController < ApplicationController
    before_action :authorized, only: [:create]

    def create
        if Course.find(params[:course].to_i)
            params.permit!
            new_match = Match.create(course_id: params[:course].to_i)
            params[:users].each do |round|
                new_round = round
                user_id = new_round['user']['id']
                new_round.delete('user')
                new_round['user_id'] = user_id
                new_round['match_id'] = new_match.id
                new_round['course_id'] = new_match.course.id
                (1..18).each {|hole| new_round["hole_#{hole}"] = new_round["hole_#{hole}"].to_i}
                Round.create(new_round)
            end
        end
    end
end
