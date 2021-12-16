require_relative '../lib/plane'

class Airport

  def initialize
    @hanger = []
  end

  def land_plane(plane)
    @hanger << plane
  end

end
