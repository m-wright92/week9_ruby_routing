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
end