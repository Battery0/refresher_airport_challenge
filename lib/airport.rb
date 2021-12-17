require_relative '../lib/plane'

class Airport

  def initialize
    @hanger = []
  end

  def land_plane(plane)
    @hanger << plane
  end

  def plane_take_off(plane)
    @hanger.delete(plane)
    puts "Plane #{plane} has taken off from the airport"
  end

end
