require_relative '../lib/plane'

class Airport

  def initialize
    @hanger = []
  end

  def add_new_plane(plane)
    @hanger << plane
  end

  def land_plane(plane)
    raise "This plane has already landed" unless plane.flying?
    @hanger << plane
  end

  def plane_take_off(plane)
    raise "That plane is not at the airport" unless plane_in_hanger?(plane)
    @hanger.delete(plane)
    puts "Plane #{plane} has taken off from the airport"
  end

  private

  def plane_in_hanger?(plane)
    @hanger.any? { |aircraft| aircraft == plane }
  end

end


# ap = Airport.new
# p1 = Plane.new
# p2 = Plane.new

# p p1
# ap.plane_take_off(p1)
# p p1