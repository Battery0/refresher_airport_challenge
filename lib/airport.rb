require_relative './plane'
require_relative './weather'

class Airport

  DEFAULT_AIRPORT_CAPACITY = 3

  def initialize(weather = Weather.new, capacity: DEFAULT_AIRPORT_CAPACITY)
    @weather = weather
    @hangar = []
    @capacity = capacity
  end

  def add_new_plane(plane)
    airport_full_error
    raise "The plane #{plane} is already in the hangar" if plane_in_hangar?(plane)
    add_plane_to_hangar(plane)
  end

  def land_plane(plane)
    raise "This plane has already landed" unless plane.flying?
    weather_check
    airport_full_error
    plane.landed
    add_plane_to_hangar(plane)
  end

  def plane_take_off(plane)
    raise "That plane is not at the airport" unless plane_in_hangar?(plane)
    weather_check
    plane.taken_off
    plane_takeoff_confirmation(plane)
    @hangar.delete(plane)
  end

  private

  def plane_takeoff_confirmation(plane)
    puts "Plane #{plane} has taken off from the airport"
  end

  def weather_check
    raise "The weather is currently stormy and planes can't take off" if @weather.type == "stormy"
  end

  def airport_full_error
    raise "The airport is currently full" if @hangar.length == @capacity
  end

  def plane_in_hangar?(plane)
    @hangar.any? { |aircraft| aircraft == plane }
  end

  def add_plane_to_hangar(plane)
    @hangar << plane
  end

end
