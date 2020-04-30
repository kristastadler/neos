require 'faraday'
require 'figaro'
require 'pry'
# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

class NearEarthObjects
  attr_reader :date,
              :neos_list

  def initialize(date)
    @date = date
    @neos_list = Faraday.new(
      url: 'https://api.nasa.gov',
      params: { start_date: date, api_key: "IyvltF6iBOUDGfveuDHUgUTS8H1IP3jM4EOVy46H"}
    )
  end

  def parse_asteroids_data
    asteroids_list_data = @neos_list.get('/neo/rest/v1/feed')
    JSON.parse(asteroids_list_data.body, symbolize_names: true)[:near_earth_objects][:"#{@date}"]
  end

  def largest_diameter
    parse_asteroids_data.map do |asteroid|
      asteroid[:estimated_diameter][:feet][:estimated_diameter_max].round(2)
    end.max { |a,b| a<=> b}
  end

  def count
    parse_asteroids_data.count
  end

  def format_data
    formatted_data = parse_asteroids_data.map do |asteroid|
      {
        name: asteroid[:name],
        diameter: "#{asteroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i} ft",
        miss_distance: "#{asteroid[:close_approach_data][0][:miss_distance][:miles].to_i} miles"
      }
    end

    {
      asteroid_list: formatted_data,
      biggest_asteroid: largest_diameter,
      total_number_of_astroids: count
    }
  end
end
