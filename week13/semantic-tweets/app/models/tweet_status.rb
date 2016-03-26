class TweetStatus
  require 'json'
  def self.status(status)
    hash = JSON.parse(File.read(File.join(Rails.root, 'app', 'assets', 'javascripts', 'words.json')))
    hash = {}.tap do |new_hash|
      new_hash["positive_words"] = hash["positive_words"].split(" ")
      new_hash["negative_words"] = hash["negative_words"].split(" ")
    end
    return is_positive?(hash, status.split(/\W+/)) ? "positive" : "negative"
  end

  def self.is_positive?(hash, status_words)
    words_type_sum(hash, "positive_words", status_words) > words_type_sum(hash, "negative_words", status_words)
  end

  def self.words_type_sum(hash, type, status_words)
    sum = 0
    status_words.each do |word|
      sum += 1 if hash[type].include? word
    end
    sum
  end

end
##to do json file
