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
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  word_input = params[:word_input]
  word = Word.new(word_input, nil)
  word.save
  redirect to('/words')
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do 
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  redirect to('/words')
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/words')
end

get('/words/search') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definitions)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:define_input], @word.id, nil)
  definition.save()
  erb(:word)
end

get('/words/:id/definitions/:definition_id/edit') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:edit_definition)
end

patch('/words/:id/definitions/:definition_id/edit') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  @definition.update(params[:name])
  erb(:word)
end

delete('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  @definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end