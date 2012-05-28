class Upload < ActiveRecord::Base
	has_many :anagrams

	FILE_STORE = "./upload/dictionary_files/"

	# Aim: Reads a dictionary File
	# Params: path=file path of the file to be read, expecting a textfile
	# TODO: Remove default path
	def readfile(path)
		dictionary_entry = IO.readlines(path) if File::exists?(path)
		return dictionary_entry.map {|x| x.delete "\n"}  #remove newline characters
	end

	# Aim: Write the contents of an uploaded file to the file storage directory
	def write_uploaded_file(uploaded_file, data)
		# create directory unless it already exists
		FileUtils.mkpath FILE_STORE.to_s unless File.directory?(FILE_STORE)

		#define file storage path
		filename = data['filename']
		path = File.join(FILE_STORE, filename)

		# write the file
		File.open(path, "wb") { |file| file.write(uploaded_file.read) }
	end
end
