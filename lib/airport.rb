require_relative '../lib/plane'

class Airport

  def new_plane(plane = Plane.new)
    @plane = plane
  end

end
