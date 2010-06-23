# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def initialize_wordnik(options={})
    options.merge!({:api_key=>ENV['WORDNIK_API_KEY']})
    @wordnik = Wordnik.new(options)
    @wotd = @wordnik.word_of_the_day
  end

end
