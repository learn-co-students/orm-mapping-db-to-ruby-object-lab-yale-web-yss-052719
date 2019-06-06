require 'pry'
class Student
  attr_accessor :id, :name, :grade

  def self.new_from_db(row)
    newStudent = Student.new
    newStudent.id = row [0]
    newStudent.name = row [1]
    newStudent.grade = row [2]
    newStudent#{row[0]}
  end

  def self.all
    sql = <<-SQL
    SELECT * FROM students
    SQL
   x= DB[:conn].execute(sql)
   
   x.map do |student|
    newStudent = Student.new
    newStudent.id = student[0]
    newStudent.name = student[1]
    newStudent.grade = student[2]
    #binding.pry
    newStudent
    
   end
  end

  def self.find_by_name(name)
    sql = <<-SQL
    SELECT * FROM students WHERE name = ?
    SQL
   x= DB[:conn].execute(sql, name)
   
   newStudent = Student.new
   newStudent.id = x[0][0]
   newStudent.name = x[0][1]
   newStudent.grade = x[0][2]
   newStudent
  
  end
  
  def save
    sql = <<-SQL
      INSERT INTO students (name, grade) 
      VALUES (?, ?)
    SQL

   x=  DB[:conn].execute(sql, self.name, self.grade)
    
  end
  
  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
    )
    SQL

    x = DB[:conn].execute(sql)
    #binding.pry
  end

  def self.drop_table
    sql = "DROP TABLE IF EXISTS students"
    DB[:conn].execute(sql)
  end

  def self.all_students_in_grade_9
    sql = <<-SQL
    SELECT * FROM students WHERE grade = 9
    SQL
   x= DB[:conn].execute(sql)
   
   x.map do |student|
    newStudent = Student.new
    newStudent.id = student[0]
    newStudent.name = student[1]
    newStudent.grade = student[2]
    #binding.pry
    newStudent
    end
  end

  def self.students_below_12th_grade
    sql = <<-SQL
    SELECT * FROM students WHERE grade < 12
    SQL
   x= DB[:conn].execute(sql)
   
   x.map do |student|
    newStudent = Student.new
    newStudent.id = student[0]
    newStudent.name = student[1]
    newStudent.grade = student[2]
    #binding.pry
    newStudent
    end
  end

  def self.all_students_in_grade_X(grade)
    sql = <<-SQL
    SELECT * FROM students WHERE grade = ?
    SQL
   x= DB[:conn].execute(sql,grade)
   
   x.map do |student|
    newStudent = Student.new
    newStudent.id = student[0]
    newStudent.name = student[1]
    newStudent.grade = student[2]
    #binding.pry
    newStudent
    end
  end

  def self.first_X_students_in_grade_10(x)
    sql = <<-SQL
    SELECT * FROM students WHERE grade = 10 LIMIT ?
    SQL
   x= DB[:conn].execute(sql,x)
   
   x.map do |student|
    newStudent = Student.new
    newStudent.id = student[0]
    newStudent.name = student[1]
    newStudent.grade = student[2]
    #binding.pry
    newStudent
    end
  end

  def self.first_student_in_grade_10
    sql = <<-SQL
    SELECT * FROM students WHERE grade = 10 LIMIT 1
    SQL
   x= DB[:conn].execute(sql)
    newStudent = Student.new
    newStudent.id = x[0][0]
    newStudent.name = x[0][1]
    newStudent.grade = x[0][2]
    newStudent
  end


end


