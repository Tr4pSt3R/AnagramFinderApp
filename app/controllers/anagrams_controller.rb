class AnagramsController < ApplicationController
  
  # before_filter :set_anagram_result
  helper_method :anagram_result

  def create
  	@upload = Upload.find(params[:upload_id])
  	@anagram = @upload.anagrams.build(params[:anagram])

    # generate the permutation of all combinations of the given word
    all_word_combo = @anagram.word_combos(@anagram.word)

    # convert the complex array result to a level-1 flattened array of strings
    all_word_combo = @anagram.word_combos_to(all_word_combo)

    # get the list of loaded dictionary words
    path = Upload::FILE_STORE + @upload.filename
    dictionary = @upload.readfile(path)

    # which of these permutations exists in the given dictionary
    
    # TODO Test time feature for Benchmark real timing
    time_taken = Benchmark.realtime do
      @anagram_result = @anagram.find_all_anagrams(all_word_combo, dictionary)
    end

    @anagram.time_taken = time_taken

    print "Time: #{time_taken}"
    print "Anagram Result: #{@anagram_result}"
    print "Dictionary: #{dictionary}"

  	@anagram.save
  	redirect_to @upload
  end

  def destroy
  	@anagram = Anagram.find(params[:id])
  	@anagram.destroy

  	redirect_to @anagram.upload
  end
end
