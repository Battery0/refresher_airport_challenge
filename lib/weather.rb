class Weather

  def type
    weather_generator = rand(0..15)

    if weather_generator.between?(0, 3)
      "sunny"
    end
  end

end
