class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Photos.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @photo = Photo.new
  end

  # GET /matches/1/edit
  def edit
  end

  def create
       #photo_params[:match_id] = params[:match_id]
      @photo = Photo.new(photo_params)
      @photo[:match_id] = params[:match_id]  
      binding.pry
  respond_to do |format|
      if @photo.save
        format.html { redirect_to :root, notice: 'Photo was successfully added.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end



  end

  def set_photo
      @photo = Photo.find(params[:id])
  end

private

  def photo_params
      params.require(:photo).permit(:match_id, :image)
    end

end
