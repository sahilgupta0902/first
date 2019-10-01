class Clock < Struct.new(:minutes)
    HOUR = 60
    DAY = 24*HOUR
  
    def self.at(hours, minutes = 0)
      new(HOUR * hours + minutes)
    end
  
    def +(minutes)
      Clock.new((self.minutes += minutes) % DAY)
    end
  
    def -(minutes)
      Clock.new((self.minutes -= minutes) % DAY)
    end
  
    def to_s
      "#{formatted_hours}:#{formatted_minutes}"
    end
  
    private
  
    def formatted_hours
      format(minutes / HOUR)
    end
  
    def formatted_minutes
      format(minutes % HOUR)
    end
  
    def format(duration)
      duration.to_s.rjust(2, '0')
    end
  end


  require 'minitest/autorun'
require_relative 'clock'

class ClockTest < MiniTest::Unit::TestCase
  def test_on_the_hour
    assert_equal "08:00", Clock.at(8).to_s
    assert_equal "09:00", Clock.at(9).to_s
  end

  def test_past_the_hour
    assert_equal "11:09", Clock.at(11, 9).to_s
  end

  def test_add_a_few_minutes
    clock = Clock.at(10) + 3
    assert_equal "10:03", clock.to_s
  end

  def test_add_over_an_hour
    clock = Clock.at(10) + 61
    assert_equal "11:01", clock.to_s
  end

  def test_wrap_around_at_midnight
    clock = Clock.at(23, 30) + 60
    assert_equal "00:30", clock.to_s
  end

  def test_subtract_minutes
    clock = Clock.at(10) - 90
    assert_equal "08:30", clock.to_s
  end

  def test_equivalent_clocks
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 37)
    assert_equal clock1, clock2
  end

  def test_wrap_around_backwards
    clock = Clock.at(0, 30) - 60
    assert_equal "23:30", clock.to_s
  end
end