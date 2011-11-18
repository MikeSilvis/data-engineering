class UploadsController < ApplicationController

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @upload }
    end
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(params[:upload])
    
    file = params[:upload][:file].read
    file.split("\n").shift

    index = 0
    gross = 0
    file.each_line do |row|
      index = index + 1 # skips header row
      next if index == 1
      row = row.split("\t")
	    @special = Special.new
	    @special.description = row[1]
	    @special.price = row[2]
	    
	    @special.purchaser = Purchaser.find_or_create_by_name(row[0],:count=>row[3])
	    @special.store = Store.find_or_create_by_name(row[5],:merchant_stores => row[4])
	    @special.save
	    gross = gross + (row[3] * row[2])
    end      
   respond_to do |format|
      if @upload.save
        format.html { redirect_to '/specials', :notice => 'Upload was successfully created.' }
        format.json { render :json => @upload, :status => :created, :location => '/specials' }
      else
        format.html { render :action => "new" }
        format.json { render :json => @upload.errors, :status => :unprocessable_entity }
      end
    end
  end

end
