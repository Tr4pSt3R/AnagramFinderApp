require 'spec_helper'
# require 'ruby-debug'

describe Anagram do
	before(:each) do
		@anagram = Anagram.new
	end

	it "should find all possible word permutations" do 
		# all possible word combinations 
		
	end

	it "should find combinations up to the size of the given word" do 
		word = "gemfile"
		perms = @anagram.word_combos(word)
		assert_equal(word.length, perms.size)
	end

	# it "should correctly calculate the factorial of a given number" do
	# 	assert_equal(3628800, 10.(@anagram.factorial)) 
	# end

	it "should find at least one combination of a given word" do
		word = "statement"
		all_word_combo = @anagram.word_combos(word)
		all_word_combo = @anagram.word_combos_to(all_word_combo)
		assert false unless all_word_combo
	end
end