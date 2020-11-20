class Round < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :match

  def score
    total = self.hole_1 + self.hole_2 + self.hole_3 + self.hole_4 + self.hole_5 + self.hole_6 + self.hole_7 + self.hole_8 + self.hole_9 + self.hole_10 + self.hole_11 + self.hole_12 + self.hole_13 + self.hole_14 + self.hole_15 + self.hole_16 + self.hole_17 + self.hole_18
    final = total - course.total
    if final > 0
      return '+' + final.to_s
    else
      return final.to_s
    end
  end
end
