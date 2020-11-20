class Course < ApplicationRecord
    has_many :rounds
    has_many :users, through: :rounds
    has_many :matches

    def num_rounds
        return self.rounds.length
    end

    def total
        return self.hole_1 + self.hole_2 + self.hole_3 + self.hole_4 + self.hole_5 + self.hole_6 + self.hole_7 + self.hole_8 + self.hole_9 + self.hole_10 + self.hole_11 + self.hole_12 + self.hole_13 + self.hole_14 + self.hole_15 + self.hole_16 + self.hole_17 + self.hole_18
    end
end
