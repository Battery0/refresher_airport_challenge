# Airport Challenge ~ 100% test coverage

To create a fully unit & feature test driven program that controls the flow of planes in and out of an airport. Planes should only be allowed to take off and land when the weather is 'sunny' and not 'stormy', a random weather generator is used to simulate weather conditions.

The program defends against the following edge cases:

* Ensuring that planes can only take off from airports they are in
* Planes must be added to the airport hangar first before being allowed to take off
* Planes that are already flying cannot take off and/or be in an airport
* Planes that are landed cannot land again and must be in an airport

## Assumptions
Assumptions were made at the project start which are outlined below:

* Planes start grounded, not flying, and need to be added to the airport hangar first before being able to take off. Trying to take off a plane before being added to the hangar will raise an error.

## User Stories
The following are the user stories used to drive the specifications of the project and create the program.

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

## Getting Started
In your terminal run:
`git clone https://github.com/Battery0/refresher_airport_challenge.git`

To install all project dependencies, in the project directory run:
`bundle`

## Usage
To interact with the program:

* Instantiate a new airport object: `heathrow = Airport.new`
  * Alternatively you can instantiate an airport object with a custom capacity argument, otherwise the default is 3: `heathrow = Airport.new(capacity: 5)`
* Instantiate as many new plane objects as you wish: `boeing_747 = Plane.new`
* Add the newly instantiated plane object(s) to the airport hangar: `heathrow.add_new_plane(boeing_747)`
* Tell the plane to take off from the airport: `heathrow.plane_take_off(boeing_747)`
  * You will be notified in the terminal if the plane was allowed to take off from the airport with regards to the weather
* Tell the plane to land at the airport `heathrow.land_plane(boeing_747)`
  * You will be notified if the plane can't land due to the weather

## Running Tests
To run the test suite, in the project directory run:

'rspec'
