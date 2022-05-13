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
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do 
  @word = Word.find(params[:id].to_i())
  erb(:edit_album)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  @word = Word.all
  erb(:words)
end

delete('/words/:id') do
  @word = word.find(params[:id].to_i())
  @word.delete
  @words = Word.all
  erb(:words)
end

post('/words/:id/definitions') do
 erb(:definitions)
end

get('/words/search') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/definitions/:define_id') do
  @definition = Definition.find(params[:word_id].to_i)
  erb(:word)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  define = Definition.new(params[:define_input], @word.id, nil)
  define.save()
  erb(:word)
end

patch('/words/:id/definitons/:define_id') do
  @word = Word.find(params[:id].to_i())
  define = Definition.find(params[:define_id].to_i())
  define.update(params[:define], @word.id)
  erb(:word)
end

delete('/words/:id/definitions/:define_id') do
  define = Definition.find(params[:define_id].to_i())
  define.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end