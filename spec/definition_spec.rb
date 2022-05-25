require 'rspec'
require 'pry'
require 'word'
require 'definition'

describe('#Definition') do

  before(:each) do
    Word.clear
    Definition.clear
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
    it('clears all definitions from storage') do
      define1 = Definition.new('greeting', @word1.id, nil)
      define1.save
      define2 = Definition.new("Hi", @word1.id, nil)
      define2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('locates a definition by its id') do
      define1 = Definition.new('greeting', @word1.id, nil)
      define1.save
      define2 = Definition.new('Hi', @word1.id, nil)
      define2.save
      expect(Definition.find(define1.id)).to(eq(define1))
    end
  end

  describe('#update') do
  it("updates a definition by its id") do
    define1 = Definition.new('greeting', @word1.id, nil)
      define1.save
    define1.update("goodbye")
    expect(define1.define).to(eq("goodbye"))
  end
end

  describe('#delete') do
    it('deletes a definition from a word') do
      define1 = Definition.new('greeting', @word1.id, nil)
      define1.save
      define2 = Definition.new('Hi', @word1.id, nil)
      define2.save
      define2.delete
      expect(Definition.all).to(eq([define1]))
    end
  end

  describe('.find_by_word') do
    it('returns definitions saved to a word') do
      word2 = Word.new('goodbye', nil)
      word2.save
      define1 = Definition.new('greeting', @word1.id, nil)
      define1.save
      define2 = Definition.new('hi', word2.id, nil)
      define2.save
      expect(Definition.find_by_word(word2.id)).to(eq([define2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      word2 = Word.new('goodbye', nil)
      def1 = Definition.new('farewell', word2.id, nil)
      def1.save
      expect(def1.word).to(eq(@word2))
    end
  end
end