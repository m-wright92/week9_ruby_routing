class Definition
  attr_accessor :define, :word_id
  attr_reader :id
  @@definitions = {}
  @@total_rows = 0

  def initialize(define, word_id, id)
    @define = define.downcase
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(definition_to_compare)
    (self.define == definition_to_compare.define) && (self.word_id == definition_to_compare.word_id)
  end

  def save
    @@definitions[self.id] = Definition.new(self.define, self.word_id, self.id)
  end

  def update(define)
    @define = define
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.all
    @@definitions.values
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@definitions[id]
  end

  def self.find_by_word(w0rd_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == w0rd_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def word
    Word.find(self.word_id)
  end
end