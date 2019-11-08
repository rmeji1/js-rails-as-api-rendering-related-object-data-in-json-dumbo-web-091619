class SightingsController < ApplicationController
  def show
    sighting = Sighting.find_by(id: params[:id])
    # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
    # render json: sighting, include: [:bird, :location]
    exceptArray = [:updated_at, :created_at]
    if sighting
      # render json: sighting.to_json(except: [:created_at, :updated_at], include: [:bird, :location])
      # render json: sighting, include: [:bird, :location], except: [:updated_at]
      render json: sighting, include: { 
          bird: { except: exceptArray},
          location: { except: exceptArray}
      }, except: exceptArray

    else
      render json: { message: 'No sighting found with that id' }
    end
  end
end
