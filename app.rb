require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  @definitions = Definition.all
  erb(:words)
end

post('/words') do
  word = params[:word_input]
  new_word = Word.new(word, nil)
  new_word.save
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  @words = Word.find(params[:id].to_i)
  erb(:word)
end

