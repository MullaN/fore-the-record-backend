class User < ApplicationRecord
    has_many :rounds
    has_many :courses, through: :rounds
    has_many :matches, through: :rounds

    has_secure_password

    def handicap
        last_twenty = self.rounds.sort_by {|round| round.created_at}.reverse[0..19]
        best_eight = last_twenty.sort_by {|round| round.score.to_i}[0..7]
        return -(best_eight.sum {|round| round.score.to_i} / 8)
    end
end
