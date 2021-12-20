require_relative './plane'
require_relative './weather'

class Airport

  DEFAULT_AIRPORT_CAPACITY = 3

  def initialize(capacity = DEFAULT_AIRPORT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def add_new_plane(plane)
    airport_full_error
    add_plane_to_hanger(plane)
  end

  def land_plane(plane)
    raise "This plane has already landed" unless plane.flying?
    airport_full_error
    plane.landed
    add_plane_to_hanger(plane)
  end

  def plane_take_off(plane)
    raise "That plane is not at the airport" unless plane_in_hanger?(plane)
    plane.taken_off
    puts "Plane #{plane} has taken off from the airport"
    @hanger.delete(plane)
  end

  private

  def airport_full_error
    raise "The airport is currently full" if @hanger.length == @capacity
  end

  def plane_in_hanger?(plane)
    @hanger.any? { |aircraft| aircraft == plane }
  end

  def add_plane_to_hanger(plane)
    @hanger << plane
  end

end

# p ap = Airport.new(2)
# p p1 = Plane.new
# p weather = Weather.new
# p2 = Plane.new
# p3 = Plane.new
# # p4 = Plane.new

# ap.add_new_plane(p1)
# ap.add_new_plane(p2)
# p ap.add_new_plane(p3)
# ap.plane_take_off(p3)
# ap.add_new_plane(p4)
# ap.land_plane(p3)
