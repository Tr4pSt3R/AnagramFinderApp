class Anagram < ActiveRecord::Base
	belongs_to :upload

	# Aim: 	Given a word, return all possible variable-length 
	# 		combinations of this word
	# param: word ##spawn my minions
	# TODO: Rename vars and class appropriately
	def word_combos(word)
		word = word.chars.to_a
		all_word_combo = []
		i = 1
		while i <= word.size
			all_word_combo << word.permutation(i).to_a
			i+=1
		end
		return all_word_combo
	end

	# Aim: Convert all word combos to strings. 
	# params: perms = is an array of arrays where 
	# 		  the first element contains all one-letter "words", 
	# 			the second element contains all two-letter "words", 
	# 			and so on and so forth
	# returns: true_perms
	# return type: Array
	def word_combos_to(all_word_combo)
		true_perms = all_word_combo.flatten(1)
		return true_perms.map {|x| x.join}
	end

	# Aim: Size of the 
	def permutation_size(word)
		n=word.size
		r=0
		while r<=n
			n.factorial/(n-r).factorial
			r+=1
		end
	end

	# Aim: Calculate the factorial of a given number
	# param(s): n = the number whose factorial is to be calculated
	# returns: n! = factorial of n
	# note: refactor factorial function. Put into a mathematical model
	def factorial
		(1..self).reduce(:*)
	end


	def find_all_anagrams(all_word_combo, dictionary)
		return all_word_combo & dictionary
	end
end
