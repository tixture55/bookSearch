class SimpleLogsController < ApplicationController
  before_action :set_simple_log, only: [:show, :edit, :update, :destroy]

  # GET /simple_logs
  # GET /simple_logs.json
  def index
    @simple_logs = SimpleLog.all
  end

  # GET /simple_logs/1
  # GET /simple_logs/1.json
  def show
  end

  # GET /simple_logs/new
  def new
    @simple_log = SimpleLog.new
  end

  # GET /simple_logs/1/edit
  def edit
  end

  # POST /simple_logs
  # POST /simple_logs.json
  def create
    @simple_log = SimpleLog.new(simple_log_params)

    respond_to do |format|
      if @simple_log.save
        format.html { redirect_to @simple_log, notice: 'Simple log was successfully created.' }
        format.json { render :show, status: :created, location: @simple_log }
      else
        format.html { render :new }
        format.json { render json: @simple_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /simple_logs/1
  # PATCH/PUT /simple_logs/1.json
  def update
    respond_to do |format|
      if @simple_log.update(simple_log_params)
        format.html { redirect_to @simple_log, notice: 'Simple log was successfully updated.' }
        format.json { render :show, status: :ok, location: @simple_log }
      else
        format.html { render :edit }
        format.json { render json: @simple_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simple_logs/1
  # DELETE /simple_logs/1.json
  def destroy
    @simple_log.destroy
    respond_to do |format|
      format.html { redirect_to simple_logs_url, notice: 'Simple log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simple_log
      @simple_log = SimpleLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simple_log_params
      params.require(:simple_log).permit(:text)
    end
end
