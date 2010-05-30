require File.dirname(__FILE__) + '/../test_helper'
 
class TeamTest < ActiveSupport::TestCase
 
  def setup
    @team = Factory.build(:team, :name => nil)
  end 
 
  # These two tests really just check that the validations are there, not that they're working.
  # Rails tests that.
  # DEBT: Looking into shoulda macros when/if Rails 3 compliant

  def test_invalid_without_name
    assert_errors_contain @team, :name, 'blank'
  end

  # TODO: Delete this someday. Don't need this anymore, but keeping for reference
  # def test_invalid_if_non_unique_name
  #   Factory.create(:team)
  #   @team.name = 'Mets'
  #   assert_errors_contain @team, :name, 'taken'
  # end
 
end
