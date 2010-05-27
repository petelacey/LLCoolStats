require File.dirname(__FILE__) + '/../test_helper'
 
class TeamTest < ActiveSupport::TestCase
 
  def setup
    @team = Team.new
  end 
 
  # These two tests really just check that the validations are there, not that they're working.
  # Rails tests that.
  # DEBT: Looking into shoulda macros when/if Rails 3 compliant

  def test_invalid_without_name
    assert_errors_contain @team, :name, 'blank'
  end

  def test_invalid_if_non_unique_name
    @team.attributes = {:name => teams(:mets).name}
    assert_errors_contain @team, :name, 'taken'
  end
 
end
