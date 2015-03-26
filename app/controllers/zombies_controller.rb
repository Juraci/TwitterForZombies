class ZombiesController < ApplicationController

  def custom_decomp
    @zombie = Zombie.find(params[:id])
    @zombie.decomp = params[:zombie][:decomp]
    @zombie.save

    respond_to do |format|
      format.js
      format.json { render json: @zombie.to_json(only: :decomp) }
    end
  end

  def decomp
    @zombie = Zombie.find(params[:id])
    if @zombie.decomp == 'Dead (again)'
      render json: @zombie.to_json(only: :decomp), status: :unprocessable_entity
    else
      render json: @zombie.to_json(only: :decomp)
    end
  end

  def index
    @zombies = Zombie.includes(:brain).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @zombies }
    end
  end

  def show
    @zombie = Zombie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zombie }
    end
  end

  def new
    @zombie = Zombie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zombie }
    end
  end

  def edit
    @zombie = Zombie.find(params[:id])
  end

  def create
    @zombie = Zombie.new(params[:zombie])

    respond_to do |format|
      if @zombie.save
        format.html { redirect_to @zombie, notice: 'Zombie was successfully created.' }
        format.json { render json: @zombie, status: :created, location: @zombie }
      else
        format.html { render action: "new" }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def update
    @zombie = Zombie.find(params[:id])

    respond_to do |format|
      if @zombie.update_attributes(params[:zombie])
        format.html { redirect_to @zombie, notice: 'Zombie was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @zombie = Zombie.find(params[:id])
    @zombie.destroy

    respond_to do |format|
      format.html { redirect_to zombies_url }
      format.json { head :ok }
      format.js
    end
  end
end
