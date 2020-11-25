class CoursesController < ApplicationController
    def index
        courses = Course.all
        courses = courses.sort_by {|course| course.num_rounds}.reverse
        render json: courses.to_json(except:[:created_at, :updated_at, :description], methods: ['num_rounds'])
    end
end
