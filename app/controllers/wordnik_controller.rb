class WordnikController < ApplicationController

  def index
    # initialize_wordnik will set up the @wordnik object, which we can then use to call the wordnik api.
    # it also fetches the word of the day, @wotd
    # don't forget to specify your WORDNIK_API_KEY at the bottom of config/environment.rb!
    initialize_wordnik 
  end

  def lookup
    initialize_wordnik
    if params[:commit]=="I'm Feeling Wordie"
      @word = @wordnik.random_word
    else
      @word = Word.find(params[:word_search])
    end
    @wordstring = @word.wordstring
    @definitions = @word.definitions
    @examples = @word.examples
    @phrases = @word.phrases
    @related = @word.related
  end

end
