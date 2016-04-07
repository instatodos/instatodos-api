module NameGenerator
  def self.load_words(item)
    file = File.expand_path("../name_generator/#{item}.txt", __FILE__)
    puts file
    File.read(file).split("\n")
  end

  def self.adjective
    load_words('adjectives').sample
  end

  def self.noun
    load_words('nouns').sample
  end

  def self.name
    "#{adjective}-#{noun}-#{rand(100..999)}"
  end
end
