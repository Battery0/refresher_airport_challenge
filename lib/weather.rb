class Weather

  def type
    weather_generator = rand(0..15)

    weather_generator.between?(0, 13) ? "sunny" : "stormy"
  end

end
