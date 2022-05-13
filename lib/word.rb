class Word
  @@words = {}

  def initialize(name, id)
    @name = name
    @id = id
  end

  def self.all
    @@words.values()
  end
end