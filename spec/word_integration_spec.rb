require('capybara/rspec')
require('./app.rb')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exeptions, false)

describe('the word path', {:type => :feature}) do
  before(:each) do
    Word.clear
    Definition.clear
    @word = Word.new("hello", nil)
    @word.save
  end

  it('creates a word') do
    visit('/')
    click_on('Add a new word')
    fill_in('word_input', :with => "goodbye")
    click_on('Go!')
    expect(page).to have_content("goodbye")
  end

  it('updates a word') do
    visit('/words')
    click_on("hello")
    click_on("Edit word")
    fill_in("name", :with => "goodbye")
    click_on('Update')
    expect(page).to have_content("goodbye")
  end

  it('deletes a word') do
    visit("/words/#{@word.id}/edit")
    click_on('Delete word')
    expect(page).to have_no_content("hello")
  end
end

describe('the definition path', {:type => :feature}) do
  before(:each) do
    Word.clear
    Definition.clear
    @word = Word.new("hello", nil)
    @word.save
    @definition = Definition.new("greeting", @word.id, nil)
    @definition.save
  end

  it('creates a definition') do
    visit("/words/#{@word.id}")
    fill_in('define_input', :with => "pancakes")
    click_button('Add definition')
    expect(page).to have_content('pancakes')
  end

  it('updates a definition') do
    visit("/words/#{@word.id}/definitions/#{@definition.id}")
    click_on("Edit definition")
    fill_in("name", :with => "hi")
    click_on('Update')
    expect(page).to have_content("hi")
  end

  it('deletes a definition') do
    visit("/words/#{@word.id}/definitions/#{@definition.id}/edit")
    click_on('Delete definition')
    expect(page).to have_no_content("greeting")
  end
end