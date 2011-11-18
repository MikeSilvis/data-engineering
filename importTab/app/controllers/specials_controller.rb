class SpecialsController < ApplicationController
  # GET /specials
  # GET /specials.json
  def index
    @specials = Special.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @specials }
    end
  end

  # GET /specials/1
  # GET /specials/1.json
  def show
    @special = Special.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @special }
    end
  end

  # GET /specials/new
  # GET /specials/new.json
  def new
    @special = Special.new
    @special.build_purchaser
    @special.build_store

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @special }
    end
  end

  # GET /specials/1/edit
  def edit
    @special = Special.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @special }
    end
  end

  # POST /specials
  # POST /specials.json
  def create
    @special = Special.new
    @special.description = params[:special]['description']
    @special.price = params[:special]['price']
    
    @special.purchaser = Purchaser.find_or_create_by_name(params[:special]['purchaser_attributes']['name'])
    @special.store = Store.find_or_create_by_name(params[:special]['store_attributes']['name'])
    
    @special.purchaser.count = params[:special]['purchaser_attributes']['count']
    @special.store.merchant_stores = params[:special]['store_attributes']['merchant_stores']
    
    respond_to do |format|
      if @special.save
        format.html { redirect_to '/specials/', :notice => 'Special was successfully created.' }
        format.json { render :json => @special, :status => :created, :location => @special }
      else
        format.html { render :action => "new" }
        format.json { render :json => @special.errors, :status => :unprocessable_entity }
      end
    end
  end

  def upload
      
	respond_to do |format|
		format.json { render :json => @stuff}
	end
	
  end
  # DELETE /specials/1
  # DELETE /specials/1.json
  def destroy
    @special = Special.find(params[:id])
    @special.destroy

    respond_to do |format|
      format.html { redirect_to specials_url }
      format.json { head :ok }
    end
  end
end
