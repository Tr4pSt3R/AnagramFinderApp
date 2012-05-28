class UploadsController < ApplicationController
  # GET /uploads
  # GET /uploads.json

  # helper_method :file_loading_time, 
  #               :anagram_dictionary_duration, 
  #               :anagram_result

  helper_method :set_file_loading_time

  def anagram_dictionary_duration
    anagram_dictionary_duration
  end

  def anagram_result
    anagram_result
  end

  def index
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    # get attribute values from param, manually
    filename = params[:upload][:uploaded_file].original_filename
    filetype = params[:upload][:uploaded_file].content_type
    file     = params[:upload][:uploaded_file].tempfile
    
    @upload = Upload.new(:filename => filename, :filetype => filetype)

    data = {'filename' => @upload.filename}

    # save file (+Benchmark)
    @loading_time = Benchmark.realtime do
      @upload.write_uploaded_file(file, data)
    end

    @loading_time.set_file_loading_time

    print "Loading Time: #{@loading_time}"

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render json: @upload, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end

private
  def set_file_loading_time
    loading_time = @loading_time
  end
end
