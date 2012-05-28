require 'spec_helper'
# require 'ruby-debug'

describe Upload do 
	it "should read a dictionary file" do
		upload = Upload.new
		dictionary_entry = upload.readfile(Rails.root+'./upload/dictionary_files/dictionary.txt')
		assert false unless dictionary_entry
	end
end