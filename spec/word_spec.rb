require 'pry'
require 'rspec'
require 'word'

describe('#Word') do

  before(:each) do
    Word.clear
  end

  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same word if it has the same attributes as another word') do
      word1 = Word.new('hello', nil)
      word2 = Word.new('hello', nil)
      expect(word1).to(eq(word2))
    end
  end

  describe('.clear') do
    it('clears all words') do
      word1 = Word.new('hello', nil)
      word1.save()
      word2 = Word.new('hello', nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a word to the the word class') do
      word1 = Word.new('hello', nil)
      word1.save
      expect(Word.all).to(eq([word1]))
    end
  end

  describe('.find') do
    it('locates an album by its id') do
      word1 = Word.new('hello', nil)
      word1.save
      word2 = Word.new('goodbye', nil)
      word2.save
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end

  describe('#update') do
    it("updates an word by its id") do
      word1 = Word.new('hello', nil)
      word1.save()
      word1.update("goodbye")
      expect(word1.name).to(eq("goodbye"))
    end
  end

  describe('#delete') do
    it("deletes an word by its id") do
      word1 = Word.new('hello', nil)
      word1.save
      word2 = Word.new('goodbye', nil)
      word2.save
      word2.delete()
      expect(Word.all).to(eq([word1]))
    end
  end

  describe('.search') do
    it('provides a word with the inputted word') do
      word1 = Word.new('hello', nil)
      word1.save
      word2 = Word.new('Goodbye', nil)
      word2.save
      expect(Word.search('goodbye')).to(eq(word2))
    end
  end

  describe('#definitions') do
    it('returns all definitions for a word') do
      word1 = Word.new('goodbye', nil)
      word1.save
      define1 = Definition.new('greeting', word1.id, nil)
      define1.save
      define2 = Definition.new('hi', word1.id, nil)
      define2.save
      expect(word1.definitions).to(eq([define1, define2]))
    end
  end
end