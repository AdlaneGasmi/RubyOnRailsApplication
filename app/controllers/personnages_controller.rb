class PersonnagesController < ApplicationController
   before_action :set_personnage, only: %i[ show edit update destroy ]

   before_action :authenticate_user!, except: [:index, :show]

   before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /personnages or /personnages.json
  def index
    @personnages = Personnage.all
  end

  # GET /personnages/1 or /personnages/1.json
  def show
  end

  # GET /personnages/new
  def new
    #@personnage = Personnage.new
    @personnage =current_user.personnages.build
  end

  # GET /personnages/1/edit
  def edit
  end

  def combat

  @personnage1=current_user.personnages.where("Nom LIKE ?","%" + params[:personnage1])
  @personnage2=current_user.personnages.where("Nom LIKE ?","%" + params[:personnage2])
   
  end 

 # POST /personnages or /personnages.json
  def create
    @personnage1.Nom= params[:Nom]
    #@personnage = Personnage.new(personnage_params)
  @personnage =current_user.personnages.build(personnage_params)

    respond_to do |format|
      if @personnage.save
        format.html { redirect_to @personnage, notice: "Personnage was successfully created." }
        format.json { render :show, status: :created, location: @personnage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personnage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personnages/1 or /personnages/1.json
  def update
    respond_to do |format|
      if @personnage.update(personnage_params)
        format.html { redirect_to @personnage, notice: "Personnage was successfully updated." }
        format.json { render :show, status: :ok, location: @personnage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personnage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personnages/1 or /personnages/1.json
  def destroy
    @personnage.destroy
    respond_to do |format|
      format.html { redirect_to personnages_url, notice: "Personnage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

def correct_user
  @friend = current_user.personnages.find_by(id: params[:id]) 
  redirect_to personnages_path, notice: "Not Authoriized to edit this friend " if @friend.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personnage
      @personnage = Personnage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personnage_params
      params.require(:personnage).permit(:Nom, :Points_de_vie, :Points_attaque,:user_id)
    end
end
