class User < ApplicationRecord
    has_many :rounds
    has_many :courses, through: :rounds
    has_many :matches, through: :rounds
    validates :steam_id, uniqueness: true

    def handicap
        if self.rounds.length > 0
            best_ten = self.last_twenty.sort_by {|round| round.score.to_i}[0..9]
            if best_ten.length >= 10
                divider = 10
            else
                divider = best_ten.length
            end
            return -(best_ten.sum {|round| round.score.to_i} / divider)
        else
            return 'N/A'
        end
    end

    def best_round
        if self.rounds.length > 0
            best_round = self.rounds.sort_by{|round| round.score.to_i}[0]
            return {round: best_round, score: best_round.score, course: best_round.course}
        else
            return {}
        end
    end

    def best_course
        if self.rounds.length > 0
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
        else
            return {}
        end
    end

    def last_twenty
        if self.rounds.length > 0
            return self.rounds.sort_by {|round| round.created_at}.reverse[0..19]
        else
            return []
        end
    end
end
