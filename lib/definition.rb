class Definition
  attr_accessor :define
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
end