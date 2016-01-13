require_relative 'docking_station'

bike = Bike.new
station = DockingStation.new
van = Van.new
garage = Garage.new

p station.dock(Bike.new) # dock a working bike in the station
p station.dock(Bike.new) # dock a working bike in the station
p bike.report # report bike broken
p station.dock(bike) # dock a broken bike in the station
p van.load(station.release_broken_bike) # load in the van a broken bike from the station
p van.load(station.release_working_bike) # load in the van a working bike from the station
p garage.store(van.unload) # store in the garage a bike unloaded from the van
p garage.store(van.unload) # store in the garage a bike unloaded from the van
p van.load(garage.release_working_bike) # load in the van a working bike from the garage
p station.dock(van.unload)

# possible improvements
# set a capacity for Van and Garage classes
# create a method to_s for Van, Garage and DockingStation classes to print the status of their instances
# 'rescue' the runtime errors to do not abort the program
# create a method fix for the class Bike to repair the bike
