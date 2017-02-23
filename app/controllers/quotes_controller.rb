class QuotesController < Rulers::Controller
	# return a quote
  def a_quote
    "There is nothing good or bad but thinking makes it so." +
    "\n<pre>\n#{env}\n</pre>"
  end

  def exception
    raise 'Something happened'
  end
end
