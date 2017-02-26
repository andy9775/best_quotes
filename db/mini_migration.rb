require 'sqlite3'

db_file = File.join Dir.pwd, 'db', 'development.db'
File.delete db_file if File.exist? db_file

conn = SQLite3::Database.new db_file

conn.execute <<SQL
    create table my_table (
    id INTEGER PRIMARY KEY,
    posted INTEGER,
    title VARCHAR(30),
    body VARCHAR(32000));
SQL
