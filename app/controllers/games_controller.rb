require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = Array.new(10).map { | | ('A'..'Z').to_a.sample }.join
  end

 #  def score
 #    word = params[:word]
 #    letters = params[:letters]
 #    url = "https://wagon-dictionary.herokuapp.com/#{word}"
 #    word_exist = open(url).read
 #    result = JSON.parse(word_exist)
 #    if result('found').key?
 #      @final_message = "cool"
 #      if word.chars.each do |letter|
 #        word.include? letters
 #  end
 # end
 def score
  @letters = params[:letters].split
  @word = (params[:word] || "").upcase
  @included = included?(@word, @letters)
  @english_word = english_word?(@word)
end

private

def included?(word, letters)
  word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
end

def english_word?(word)
  response = open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(response.read)
  json['found']
end
end
