require 'minitest/autorun'
require 'minitest/pride'
require './lib/NearEarthObjects'

class NearEarthObjectsTest < Minitest::Test

  def setup
    @neos = NearEarthObjects.new("2019-05-05")
  end

  def test_it_exists
    assert_instance_of NearEarthObjects, @neos
  end

  def test_it_gets_array_of_parsed_data
    all_neos = @neos.parse_asteroids_data

    assert_equal 14, all_neos.count
    assert_equal "480885 (2002 AC29)", all_neos.first[:name]
  end

  def test_it_finds_largest_diameter
    assert_equal 8913.02, @neos.largest_diameter
  end

  def test_it_counts_neos
    assert_equal 14, @neos.count
  end

  def test_it_formats_data
    assert_instance_of Hash, @neos.format_data
  end
end
