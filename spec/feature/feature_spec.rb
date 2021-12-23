require 'airport'

describe 'feature test' do

  let(:weather_good_dbl) { double(:weather_good_dbl, { type: "sunny" } ) }
  let(:weather_bad_dbl) { double(:weather_dbl, { type: "stormy" } ) }

  it 'allows multiple planes to land and take off from the airport when the weather is good' do
    airport = Airport.new(weather_good_dbl, capacity: 5)
    plane_one = Plane.new
    plane_two = Plane.new
    plane_three = Plane.new
    plane_four = Plane.new
    plane_five = Plane.new
    
    airport.add_new_plane(plane_one)
    airport.add_new_plane(plane_two)
    airport.add_new_plane(plane_three)
    airport.plane_take_off(plane_one)
    airport.plane_take_off(plane_three)
    airport.add_new_plane(plane_four)
    airport.plane_take_off(plane_two)
    airport.land_plane(plane_three)
    airport.add_new_plane(plane_five)
    airport.plane_take_off(plane_four)
    airport.plane_take_off(plane_five)
    expect(airport.land_plane(plane_one)).to eq([plane_three, plane_one])
  end

  it 'doesn\'t allow planes to take off when the weather is bad' do
    airport = Airport.new(weather_bad_dbl)
    plane_one = Plane.new
    airport.add_new_plane(plane_one)
    expect { airport.plane_take_off(plane_one) }.to raise_error("The weather is currently stormy and planes can't take off")
  end

end
