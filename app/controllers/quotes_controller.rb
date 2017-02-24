class QuotesController < Rulers::Controller
  # return a quote
  def a_quote
    @test = 'hello'
    @other = 'other'
    render :a_quote, noun: 'winking'
  end

  def exception
    raise 'Something happened'
  end
end
