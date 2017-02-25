class QuotesController < Rulers::Controller
  # return a quote
  def a_quote
    @test = 'hello'
    @other = 'other'
    render :a_quote, noun: 'winking'
  end

	def quote_1
		quote_1 = FileModel.find 1
		render :quote, obj: quote_1
	end

  def exception
    raise 'Something happened'
  end

  def index
    quotes = FileModel.all
    render :index, quotes: quotes
  end

  def new_quote
    attrs = {
      "submitter": "A Web User",
      "quote": "A picture is worth one k pixels",
      "attribution": "me"
    }

    m = FileModel.create attrs
    render :quote, obj: m
  end

  def update
    if env['REQUEST_METHOD'] == 'POST'
      quote_2 = FileModel.find 2
      quote_2["submitter"] = 'Me'
      quote_2.save
      render :quote, obj: quote_2
    else
      raise "Invalid method. Expected POST got #{env['REQUEST_METHOD']}"
    end
  end

  def by_submitter
    submissions = FileModel.find_all_by_submitter('me')
    render :index, quotes: submissions
  end
end
