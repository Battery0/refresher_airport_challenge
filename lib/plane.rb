class Plane

  def initialize
    @in_flight = false
  end

  def landed
    @in_flight = false
  end

  def taken_off
    @in_flight = true
  end

  def flying?
    @in_flight
  end

end
