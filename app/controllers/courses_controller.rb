class CoursesController < ApplicationController
    def index
        courses = Course.all
        courses = courses.sort_by {|course| course.num_rounds}.reverse
        render json: courses.to_json(only: ['id', 'name', 'cover_img'], methods: ['num_rounds'])
    end

    def show
        course = Course.find(params[:id])
        render json: courses.to_json(only: ['id', 'name', 'cover_img'], methods: ['top_ten_rounds'])
    end
end
