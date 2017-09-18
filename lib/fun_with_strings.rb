module FunWithStrings
  def palindrome?
    self.downcase.gsub(/\W/, '') == self.downcase.gsub(/\W/,'').reverse
  end
  def count_words
    count = Hash.new(0)
    words = self.split(/\W|\b/)
    words.each do |w|
      count[w.downcase] += 1 unless w.empty?
    end
    count
  end
  def anagram_groups
    output = []
    unless self.empty?
      self.split(/\b/).each do |w|
        added = false
        output.each do |g|
          if g.empty? || w.anagram?(g[0])
            g.push(w)
            added = true
          end
          break if added
        end
        output.push [w] unless added
      end
    end
    output
  end
  
  def anagram? other
    self.downcase.chars.sort == other.downcase.chars.sort
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
