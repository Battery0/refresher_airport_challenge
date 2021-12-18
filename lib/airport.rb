require_relative '../lib/plane'

class Airport

  DEFAULT_AIRPORT_CAPACITY = 3

  def initialize
    @hanger = []
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
    raise "The airport is currently full" if @hanger.length == DEFAULT_AIRPORT_CAPACITY
  end

  def plane_in_hanger?(plane)
    @hanger.any? { |aircraft| aircraft == plane }
  end

  def add_plane_to_hanger(plane)
    @hanger << plane
  end

end

# ap = Airport.new
# p1 = Plane.new
# p2 = Plane.new
# p3 = Plane.new
# p4 = Plane.new

# ap.add_new_plane(p1)
# ap.add_new_plane(p2)
# ap.add_new_plane(p3)
# ap.plane_take_off(p3)
# ap.add_new_plane(p4)
# ap.land_plane(p3)
