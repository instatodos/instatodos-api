class NameGenerator
  include Singleton

  def initialize
    @adjectives = load_words(:adjectives)
    @nouns = load_words(:nouns)
  end

  def load_words(item)
    file = File.expand_path("../name_generator/#{item}.txt", __FILE__)
    File.read(file).split("\n")
  end

  def name
    adjective = @adjectives.sample
    noun = @nouns.sample
    number = rand(100..999)
    "#{adjective}-#{noun}-#{number}"
  end
end
