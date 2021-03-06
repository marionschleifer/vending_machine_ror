require_relative '../machine'
require 'minitest/spec'
require 'minitest/autorun'

class MachineTest < MiniTest::Test
  def setup
    @machine = Machine.new(7, 16)
  end

  def test_turn_3_times
    3.times { @machine.turn }
    assert_equal(4, @machine.current_position)
  end

  def test_turn_17_times
    17.times { @machine.turn }
    assert_equal(2, @machine.current_position)
  end

   def test_only_turn_if_all_turntables_are_closed
    @machine.turn_tables[2].current_section.add_article(Article.new('Mars', 1.2, Date.new(2016, 1, 1)))
  	@machine.turn_tables[2].unlock
  	assert_equal(false, @machine.turn)
  end

end