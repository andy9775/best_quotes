require './config/application'

# modify the background color by wrapping the application result
class ModBackground
  def initialize(app, color = 'white')
    @app = app
    @color = color
  end

  def call(env)
    status, headers, content = @app.call(env)
    content[0] = %(
    <html>
    <body style=\"background-color: #{@color}\">
    #{content[0]}
    </body>
    </html>)

    [status, headers, content]
  end
end

# set the content length header
class ContentLength
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, content = @app.call(env)
    headers['Content-Length'] = content[0].length.to_s
    [status, headers, content]
  end
end

# benchmark application speed
class Bench
  def initialize(app)
    @app = app
  end

  def call(env)
    start = Time.now
    result = @app.call(env)
    finish = Time.now
    puts %(Request took #{(finish - start).to_f} seconds)
    result
  end
end

# gets called last (before send) and uses the result of all below (LIFO)
use Bench
use ContentLength
use ModBackground, '#eff59e' # color is passed to initialize
# similar to rails config.ru file except rails requires
# config/environment.rb and environment.rb requires the application
# calls Rulers::Application.call() to get the result
run BestQuotes::Application.new
