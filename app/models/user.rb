class User < ApplicationRecord
    has_many :rounds
    has_many :courses, through: :rounds
    has_many :matches, through: :rounds
    validates :email, uniqueness: true
    validates :steam_id, uniqueness: true

    has_secure_password

    def handicap
        best_eight = self.last_twenty.sort_by {|round| round.score.to_i}[0..7]
        return -(best_eight.sum {|round| round.score.to_i} / 8)
    end

    def best_round
        best_round = self.rounds.sort_by{|round| round.score.to_i}[0]
        return {round: best_round, score: best_round.score, course: best_round.course}
    end

    def best_course
        course_track = {}
        self.rounds.each do |round|
            if (course_track[round.course.id])
                course_track[round.course.id][:total] += round.score.to_i
                course_track[round.course.id][:num_rounds] += 1
                course_track[round.course.id][:average] = course_track[round.course.id][:total] / course_track[round.course.id][:num_rounds]
            else
                course_track[round.course.id] = {total: round.score.to_i, num_rounds: 1, average: round.score.to_i}
            end
        end

        return Course.find(course_track.min_by {|k, v| v[:average]}[0])
    end

    def last_twenty
        return self.rounds.sort_by {|round| round.created_at}.reverse[0..19]
    end
end
