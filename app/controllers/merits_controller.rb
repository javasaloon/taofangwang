class MeritsController < ApplicationController
  # GET /merits
  # GET /merits.json
  def index
    @merits = Merit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @merits }
    end
  end

  # GET /merits/1
  # GET /merits/1.json
  def show
    @merit = Merit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @merit }
    end
  end

  # GET /merits/new
  # GET /merits/new.json
  def new
    @merit = Merit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @merit }
    end
  end

  # GET /merits/1/edit
  def edit
    @merit = Merit.find(params[:id])
  end

  # POST /merits
  # POST /merits.json
  def create
    @merit = Merit.new(params[:merit])

    respond_to do |format|
      if @merit.save
        format.html { redirect_to @merit, notice: 'Merit was successfully created.' }
        format.json { render json: @merit, status: :created, location: @merit }
      else
        format.html { render action: "new" }
        format.json { render json: @merit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /merits/1
  # PUT /merits/1.json
  def update
    @merit = Merit.find(params[:id])

    respond_to do |format|
      if @merit.update_attributes(params[:merit])
        format.html { redirect_to @merit, notice: 'Merit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @merit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merits/1
  # DELETE /merits/1.json
  def destroy
    @merit = Merit.find(params[:id])
    @merit.destroy

    respond_to do |format|
      format.html { redirect_to merits_url }
      format.json { head :no_content }
    end
  end
end
