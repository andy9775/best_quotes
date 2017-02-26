require 'sqlite3'
require 'rulers/sqlite_model'
require 'rulers'

class MyTable < Rulers::Model::SQLite; end

puts MyTable.schema.inspect

# create a row
mt = MyTable.create(title: 'it happened',
                    posted: 1,
                    body: 'it did')

mt = MyTable.create('title' => 'I saw it')

puts "Count #{MyTable.count}"

top_id = mt[:id].to_i

(1..top_id).each do |id|
  mt_id = MyTable.find id
  puts "Found title #{mt_id[:title]}"
end


p '----------'

mt = MyTable.create 'title' => 'I saw it again'
puts "Title #{mt['title']}"
mt[:title] = 'I really did'

mt.save!

mt2 = MyTable.find mt['id']

puts "Title #{mt2.title}"
