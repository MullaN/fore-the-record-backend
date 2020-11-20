class CoursesController < ApplicationController
    def index
        courses = Course.all
        render json: courses.to_json(only: ['id', 'name', 'cover_img'], methods: ['num_rounds'])
    end
end
