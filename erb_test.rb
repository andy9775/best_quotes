require 'erubis'

def temp
  %(<%= "Hello #{yield}" %>)
 end

t = temp { 'world' }

eruby = Erubis::Eruby.new t

puts eruby.evaluate
