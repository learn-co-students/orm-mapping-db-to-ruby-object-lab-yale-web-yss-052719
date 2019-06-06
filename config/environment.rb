require 'sqlite3'
DB = {:conn => SQLite3::Database.new("db/students.db")}
DB[:conn].results_as_hash = true
require_relative '../lib/student'