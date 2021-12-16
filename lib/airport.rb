require_relative '../lib/plane'

class Airport

  def initialize
    @hanger = []
  end

  def new_plane(plane = Plane.new)
    plane
  end

  def land_plane(plane)
    @hanger << plane
  end

end
