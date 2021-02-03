# == Schema Information
#
# Table name: buildings
#
#  id                   :integer          not null, primary key
#  building_code_heprod :string(255)
#  location_id          :integer
#  address              :string(255)
#  address2             :string(255)
#  city                 :string(255)      default("Ann Arbor")
#  state                :string(255)      default("Mi")
#  zip                  :string(255)      default("48109")
#  description          :text
#  history              :text
#  created_at           :datetime
#  updated_at           :datetime
#  building_short_code  :string(255)
#  name                 :string
#  latitude             :float
#  longitude            :float
#

class BuildingsController < ApplicationController
  ## We are going to check authentication before accessing
  # anything but show and index
  before_filter :authenticate_user!, except: [:index, :show]

  # after_action :verify_authorized, except: [:index]
  def index
    @buildings = Building
    matching_locations = @buildings.includes(:location)
    filtered_locations = matching_locations.select { |loc| loc.location.visible }
    if user_signed_in?
      filtered_locations = matching_locations
    else
      filtered_locations = matching_locations.select { |loc| loc.location.visible }
    end
    @buildings = filtered_locations.paginate(page: params[:page], per_page: @per_page)

    @page_title = 'Buildings'
  end

  def show
    @building = Building.find(params[:id])
    @page_title = @building.location.name
    unless @building.location.visible? || user_signed_in?
      redirect_to users_path, notice: 'Must be authorized to see that building.'
      return
    end
  end

  def new
    @building = Building.new
    @building.location = Location.new
    # @building.location.assets.build
    @page_title = 'Add a New Building'
  end

  def edit
    @location = Location.find(params[:id])
    @building = Building.find(params[:id])

    @page_title = 'Editing Building: ' + @building.location.name
  end

  def create
    @building = Building.new(app_params)
    if @building.save
      redirect_to(@building, notice: 'Building was successfully added.')
    else
      render 'new'
    end
  end

  def update
    @building = Building.find(params[:id])
    if @building.update_attributes(app_params)
      redirect_to(@building, notice: 'Building was successfully updated.')
    else
      render action: 'edit'
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    redirect_to buildings_path, flash: { success: 'Building destroyed.' }
  end

  private
  def app_params
    params.require(:building).permit(:building_code_heprod, :location_id, :address, :address2, :city, :state, :zip, :description, :history, :building_short_code, location_attributes: [:id, :name, :descritpion, :latitude, :longitude, :picture, :building_sign])
  end
end
