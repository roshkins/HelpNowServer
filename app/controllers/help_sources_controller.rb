class HelpSourcesController < ApplicationController
  before_action :set_help_source, only: [:show, :edit, :update, :destroy]

  # GET /help_sources
  # GET /help_sources.json
  def index
    @help_sources = HelpSource.all
  end

  # GET /help_sources/1
  # GET /help_sources/1.json
  def show
  end

  # GET /help_sources/new
  def new
    @help_source = HelpSource.new
  end

  # GET /help_sources/1/edit
  def edit
  end

  # POST /help_sources
  # POST /help_sources.json
  def create
    @help_source = HelpSource.new(help_source_params)

    respond_to do |format|
      if @help_source.save
        format.html { redirect_to @help_source, notice: 'Help source was successfully created.' }
        format.json { render :show, status: :created, location: @help_source }
      else
        format.html { render :new }
        format.json { render json: @help_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /help_sources/1
  # PATCH/PUT /help_sources/1.json
  def update
    respond_to do |format|
      if @help_source.update(help_source_params)
        format.html { redirect_to @help_source, notice: 'Help source was successfully updated.' }
        format.json { render :show, status: :ok, location: @help_source }
      else
        format.html { render :edit }
        format.json { render json: @help_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /help_sources/1
  # DELETE /help_sources/1.json
  def destroy
    @help_source.destroy
    respond_to do |format|
      format.html { redirect_to help_sources_url, notice: 'Help source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_source
      @help_source = HelpSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_source_params
      params.require(:help_source).permit(:help_name, :help_phone, :description, :website)
    end
end
