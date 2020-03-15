require "sinatra"
require "sinatra/reloader"
set :database, { adapter: "sqlite3", database: "mydb.db" }
require './models/student'
require './models/student_class'
require './models/college_class'

get '/' do
    Student.all.to_yam1 + CollegeClass.all.to_yam1 + StudentClass.all.to_yam1
end

get '/students' do
   @students = Student.all
   erb :students
end

get '/student/:id' do
   @student = Student.find(params[:id])
   if @student.nil?
      return "Student not found" 
   end
   erb :student
end

