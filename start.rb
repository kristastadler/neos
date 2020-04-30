require './lib/NearEarthObjects'

puts "________________________________________________________________________________________________________________________________"
puts "Welcome to NEO. Here you will find information about how many meteors, astroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
puts "Please enter a date in the following format YYYY-MM-DD."
print ">>"

date = gets.chomp
neos = NearEarthObjects.new(date)
formated_date = DateTime.parse(date).strftime("%A %b %d, %Y")
asteroid_list = neos.parse_asteroids_data

column_labels = { name: "Name", diameter: "Diameter", miss_distance: "Missed The Earth By:" }
column_data = column_labels.each_with_object({}) do |(col, label), hash|
  hash[col] = {
    label: label,
    width: 30 }
end

header = "| #{ column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"
divider = "+-#{column_data.map { |_,col| "-"*col[:width] }.join('-+-') }-+"

def format_row_data(row_data, column_data)
  row = row_data.keys.map { |key| row_data[key].ljust(column_data[key][:width]) }.join(' | ')
  puts "| #{row} |"
end

def create_rows(neos, column_data)
  rows = neos.format_data[:asteroid_list].each { |asteroid| format_row_data(asteroid, column_data) }
end

puts "______________________________________________________________________________"
puts "On #{formated_date}, there were #{neos.count} objects that almost collided with the earth."
puts "The largest of these was #{neos.largest_diameter} ft. in diameter."
puts "\nHere is a list of objects with details:"
puts divider
puts header
create_rows(neos, column_data)
puts divider
