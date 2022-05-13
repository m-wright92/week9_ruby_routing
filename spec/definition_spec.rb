require 'rspec'
require 'pry'
require 'word'
require 'definition'

describe('#Definition') do

  before(:each) do
    Word.clear()
    @word1 = Word.new("hello", nil)
    @word1.save
  end

  describe('#==') do
    it('is the same definition if it has the same attributes as another definition regardless of case') do
      define1 = Definition.new('greeting', @word1.id, nil)
      define2 = Definition.new('Greeting', @word1.id, nil)
      expect(define1).to(eq(define2))
    end
  end

  describe('.all') do
    it('returns a list of all definitions') do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a definition for a word') do
      define1 = Definition.new('greeting', @word1.id, nil)
      define1.save
      expect(Definition.all).to(eq([define1]))
    end
  end

  describe('.clear') do
    it("clears all definitions from storage") do
      define1 = Definition.new('greeting', @word1.id, nil)
      define1.save
      define2 = Definition.new("Hi", @word1.id, nil)
      define2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end
end