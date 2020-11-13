# frozen_string_literal: true

class Admin::WorkshopsController < AdminController

  before_action :set_workshop, only: [:show, :edit, :update, :destroy]

  # GET /admin/workshops
  # GET /admin/workshops.json
  def index
    @workshops = Workshop.all
  end

  # GET /admin/workshops/1
  # GET /admin/workshops/1.json
  def show; end

  # GET
  def new
    @workshop = Workshop.new
  end

  # GET /admin/workshops/1/edit
  def edit
  end

  # POST
  def create
    @workshop = Workshop.new(workshop_params)

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to admin_workshop_path(@workshop), notice: I18n.t('messages.notices.successfully_created', model_name: 'Workshop') }
        format.json { render :show, status: :created, location: @workshop }
      else
        format.html { render :new }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end

  end

  def update

    respond_to do |format|
      if @workshop.update(workshop_params)
        format.html { redirect_to admin_workshop_path(@workshop), notice: I18n.t('messages.notices.successfully_updated', model_name: 'Workshop') }
        format.json { render :show, status: :created, location: @workshop }
      else
        format.html { render :new }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @workshop.destroy

    respond_to do |format|
      format.html { redirect_to admin_workshops_path, notice: I18n.t('messages.notices.successfully_destroyed', model_name: 'Workshop') }
      format.json { head :no_content }
    end
  end

  private

  def set_workshop
    @workshop = Workshop.find(params[:id])
  end

  def workshop_params
    # Strong Parameters
    params.require(:workshop).permit(:name, :short_description,
                                     :full_description, :duration,
                                     :attendees, :workshop_date,
                                     :start_time, :status)
  end

end
