class Word
  attr_reader :name, :id
  @@words = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name.downcase
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def update(name)
    @name = name
  end

  def delete
    @@words.delete(self.id)
  end

  def self.search(name)
    @@words.each do |word|
      if word[1].name == name
        return word[1]
      end
    end
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end