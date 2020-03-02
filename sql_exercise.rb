require 'sqlite3'

if File.exists?("maindata.db")
    File.delete("maindata.db")
end

db = SQLite3::Database.new("maindata.db")

db.execute <<SQL
    CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        email VARCHAR,
        password VARCHAR);
SQL

db.execute("INSERT INTO users(email, password) values(?,?);",["bob@sample.com","pass123"])
db.execute("INSERT INTO users(email, password) values(?,?);",["ignacious7@hotmail.com","bjhs76"])
db.execute("INSERT INTO users(email, password) values(?,?);",["egbert@aol.com","yolkman84"])

my_array = db.execute("SELECT * FROM users;")

puts my_array