require 'pry'
require 'rspec'
require 'word'

describe('#Word') do
  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a word to the the word class') do
      word1 = Word.new('hello', nil)
      word1.save
      expect(Word.all).to(eq(word1))
    end
  end
end